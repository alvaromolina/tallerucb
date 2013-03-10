def palindromo?(word)
  #solucion para no contar caracteres especiales
  #zaaword = word.downcase.gsub(/\W/,'')
  word = word.downcase.gsub(' ','')
  word == word.reverse
end

