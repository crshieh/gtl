puts 'Hello, welcome to Captain Johnny\'s Casino, what is your name?'
@name = gets.chomp
puts 'Hello, please take a seat, ' + @name + "."

def ask_recursively question
	puts question
	reply = gets.chomp.downcase
	if reply == 'yes'
		puts "Good, let's start."
		card_value = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
		suits = [' of Spades', ' of Hearts', ' of Diamonds', ' of Clubs']
		deck = card_value.product(suits)
		
		def calculate_total(card_value)
			arr = card_value.map{|e| e[0]}

			total = 0
			arr.each do |value|
				if value == "A"
					total += 11
				elsif value.to_i == 0
					total += 10
				else
					total += value.to_i
				end
			end

			arr.select{|e| e == "A"}.count.times do
				total -= 10 if total > 21
			end

			total
		end

		playercards = []
		dealercards = []

		deck.shuffle!
		playercards << deck.pop
		dealercards << deck.pop
		playercards << deck.pop
		dealercards << deck.pop

		dealertotal = calculate_total(dealercards)
		playertotal = calculate_total(playercards)

		puts "You have: #{playercards[0]} and #{playercards[1]}, for a total of #{playertotal}, 
		against the dealer showing a #{dealercards[0]}."  
		
		if playertotal == 21 && dealertotal < 21
			puts "Congratulations, you win!!"
		else
			def ask_recursively hitting
				puts hitting
				hitstand = gets.chomp.downcase
				if hitstand == 'hit'
					new_card = deck.pop
					playercards << new_card
					playertotal = calculate_total(playercards)
					puts "You have received a new card: #{new_card} with a total value of #{playertotal}"
				elsif hitstand == 'stand'
					puts "You have chose to stand"
				else
					puts "Please answer 'hit' or 'stand' only, thanks!"
					ask_recursively hitting
				end
			end
			ask_recursively "Would you like to hit or stand?"
		end



		#puts "Dealer is showing an undercard of #{dealercards[1]} with a total of #{dealertotal}."
		#if dealertotal < 17
		#	new_card = deck.pop
		#	puts "Dealer receiv"



		# not sure if this is correct here: ask_recursively question



	elsif reply == 'no'
		puts "Ok, " + @name + ", I see you lost your shirt today, bye!"
	else puts "Answer 'yes' or 'no' please, thanks!"
		ask_recursively question 
	end 
end 

ask_recursively "Would you like to play a game of blackjack?"

