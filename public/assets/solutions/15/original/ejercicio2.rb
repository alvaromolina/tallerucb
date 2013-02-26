def suma_digitos
	sum, number = 0, 2**1000
	str = number.to_s
	#y = str.scan(/./)
	#y.each do |c|
	str.split('').each do |c|
		sum += c.to_i
	end
	sum
end

