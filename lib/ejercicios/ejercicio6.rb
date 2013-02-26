def contar_palabras(frase)
  arr = {}
  frase.downcase.split.each do |s|
    if  arr[s]
      arr[s] +=1
    else
      arr[s] =1
    end
  end  
  arr
end
=begin
def contar_palabras(frase)
  arr = {}
  frase.downcase.scan(/\w+/).each do |s|
    if  arr[s]
      arr[s] +=1
    else
      arr[s] =1
    end
  end  
  arr
end
=end
#puts contar_palabras("A man, a plan, a canal -- Panama")
