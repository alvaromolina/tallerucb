=begin
def combinar_anagramas(words)
  words.group_by{|w| w.downcase.chars.sort.to_s}.values
end
=end
def combinar_anagramas(words)
  cage = Hash.new()
  words.each do |word|
      sorted_word = word.downcase.split('').sort.join
      if cage.has_key?(sorted_word)
          cage.store(sorted_word, cage.fetch(sorted_word).push(word))
      else
          cage.store(sorted_word, Array.new(1,word))
      end
  end
  return cage.values
end
#puts combinar_anagramas(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])