def palindromo?(word)
  #solucion para no contar caracteres especiales
  #word = word.downcase.gsub(/\W/,'')
  word = word.downcase.gsub(' ','')
  word == word.reverse
end

