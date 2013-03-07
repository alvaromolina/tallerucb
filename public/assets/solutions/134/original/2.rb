def cambio(monto,monedas)
     monedas.sort! { |a, b| b <=> a }

     # memoize solutions
     optimal_change = Hash.new do |hash, key|
       hash[key] = if key < monedas.min
         []
       elsif monedas.include?(key)
         [key]
       else
         monedas.
           # prune unhelpful monedas
           reject { |moneda| moneda > key }.

           # prune monedas that are factors of larger monedas
           inject([]) {|mem, var| mem.any? {|c| c%var == 0} ? mem : mem+[var]}.

           # recurse
           map { |moneda| [moneda] + hash[key - moneda] }.

           # prune unhelpful solutions
           #reject { |change| change.sum != key }.

           # pick the smallest, empty if none
           min { |a, b| a.size <=> b.size } || []
       end
     end

     optimal_change[monto]
end


puts cambio(39,[25,10,5,1]).inspect
puts cambio(14,[10,7,1]).inspect
puts cambio(3,[25,10,5,1]).inspect


