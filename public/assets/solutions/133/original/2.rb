def format_number(number)
  number.to_s.reverse.scan(/(?:\d*\.)?\d{1,3}-?/).join(',').reverse
end
