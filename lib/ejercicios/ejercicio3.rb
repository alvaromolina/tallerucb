def suma_fibo
  sum, a, b,x = 0, 1, 2, 1
  while x < 4000
      sum += b if b.odd?
      a, b = b, a + b
      x +=1
  end
  sum
end


