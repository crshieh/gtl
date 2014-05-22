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

def ask_hitting hitt, deck, dealercards, playercards
  puts hitt
  hitstand = gets.chomp.downcase
  playertotal = calculate_total(playercards)
  if hitstand == 'hit'
    new_card = deck.pop
    playercards << new_card
    # calculate player total
    playertotal = calculate_total(playercards)

    puts "You have received a new card: #{new_card} with a total value of #{playertotal}"
    if playertotal < 21
      ask_hitting "Would you like to 'hit' or 'stand'?", deck, dealercards, playercards
    else 
      puts "Sorry you busted!"
    end
    ask_recursively "Would you like to play a game of blackjack?"
  elsif hitstand == 'stand'
    puts "You have chose to stand"
    dealertotal = calculate_total(dealercards)
    puts "Dealer has a total of #{dealertotal}"
    if dealertotal < 17
     dealer_hitting "Dealer has less than 17 and hits again.", deck, dealercards, playertotal
    elsif dealertotal > 21
      puts "Dealer busted with #{dealertotal}, you won." 
    elsif dealertotal > playertotal
      puts "Sorry, you lost."
    elsif dealertotal < playertotal
      puts "You won!"
    else 
      puts "Push."
    end
  else
    puts "Please answer 'hit' or 'stand' only, thanks!"
    ask_hitting hitt "Would you like to 'hit' or 'stand'?", deck, dealercards, playercards
  end
end

def dealer_hitting hitt, deck, dealercards, superman
  puts hitt
  new_card = deck.pop
  dealercards << new_card
  # calculate player total
  dealertotal = calculate_total(dealercards)
  if dealertotal > 21
    puts "Dealer busted with #{dealertotal}, you won." 
  elsif dealertotal > superman
    puts "Sorry, you lost."
  elsif dealertotal < superman
    puts "You won!"
  else 
    puts "Push."
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
      ask_hitting "Would you like to 'hit' or 'stand'?", deck, dealercards, playercards
    end

  elsif reply == 'no'
    puts "Ok, " + @name + ", I see you lost your shirt today, bye!"
  else
    puts "Answer 'yes' or 'no' please, thanks!"
    ask_recursively question
  end
end
ask_recursively "Would you like to play a game of blackjack?"
