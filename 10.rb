
def ask_recursively question
	puts question
	reply = gets.chomp.downcase
	if reply =='yes'
		true
	elsif reply == 'no'
		false
	else 
		puts 'please answer "yes" or "no" here.'
		ask_recursively question	#This is magic line.
	end
end
ask_recursively 'do you wet the bed'