input = ''
while input != 'bye'
	puts input
	input = gets.chomp
end
'Come again soon!'

#7.4
puts "hello, what's your name?"
name = gets.chomp
puts "Hello, " + name	+"."
if name == "Chris"
	puts "What a lovely name!"
else
	if name == "Katy"
		puts "What a lovely name!"
	end
end
