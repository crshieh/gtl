puts 'Hello, welcome to Captain Johnny\'s Casino, what is your name?'
@name = gets.chomp
puts 'Hello, please take a seat, ' + @name + "."

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

def ask_hitting hitt, deck
 puts hitt
 hitstand = gets.chomp.downcase
 if hitstand == 'hit'
   deck.pop
 elsif hitstand == 'stand'
   puts "You have chose to stand"
 else
   puts "Please answer 'hit' or 'stand' only, thanks!"
   ask_hitting hitt
 end
end

def ask_recursively question
 puts question
 reply = gets.chomp.downcase
 if reply == 'yes'
   puts "Good, let's start."
   card_value = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
   suits = [' of Spades', ' of Hearts', ' of Diamonds', ' of Clubs']
   deck = card_value.product(suits)

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
     new_card = ask_hitting "Would you like to 'hit' or 'stand'?", deck
     unless new_card.nil? #this means unless I choose "stand" then, we will continue the below
       playercards << new_card
       playertotal = calculate_total(playercards)
       puts "You have received a new card: #{new_card} with a total value of #{playertotal}"



       
     end
   end
 elsif reply == 'no'
   puts "Ok, " + @name + ", I see you lost your shirt today, bye!"
 else
   puts "Answer 'yes' or 'no' please, thanks!"
		ask_recursively question 
	end 
end 

ask_recursively "Would you like to play a game of blackjack?"

