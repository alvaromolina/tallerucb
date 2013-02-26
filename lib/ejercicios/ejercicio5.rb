def palindromo?(word)
  #word = word.downcase.gsub(/\W/,'')
  word = word.downcase.gsub(' ','')
  word == word.reverse
end