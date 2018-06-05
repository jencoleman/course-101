require 'pry'
SUITS = ["Clubs", "Diamonds", "Spades", "Hearts"]
FACES = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"] +
        ["Nine", "Ten", "Jack", "Queen", "King"]
VALUES = [[1, 11], 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
# Initialized deck
def initialize_deck
  deck = {}
  SUITS.each do |suit|
    FACES.each do |face|
      deck["#{face}_of_#{suit}".to_sym] = VALUES[FACES.index(face)]
    end
  end
  deck.to_a
end

def deal_one(deck, player1)
  card = deck.sample
  player1.push(card)
  deck.delete(card)
end

def opening_deal(deck, player1, player2)
  2.times do
    deal_one(deck, player1)
    deal_one(deck, player2)
  end
end

def display_player_hand(player1, player2)
  system 'clear'
  puts ''
  puts "Player's Hand:"
  player1.each { |array| puts array[0].to_s + ' -- ' + array[1].to_s }
  puts ''
  puts "Dealer's Hand:"
  puts player2[0][0].to_s + ' -- ' + player2[0][1].to_s
  puts 'Unknown Card'
  puts ''
end

def display_computer_hand(player1, player2)
  system 'clear'
  puts ''
  puts "Player's Hand:"
  player1.each { |array| puts array[0].to_s + ' -- ' + array[1].to_s }
  puts ''
  puts "Dealer's Hand:"
  player2.each { |array| puts array[0].to_s + ' -- ' + array[1].to_s }
  puts ''
end

def calculate(hand)
  total = 0
  hand.select { |card| card[1] != [1, 11] }.each do |card|
    total += card[1]
  end
  hand.select { |card| card[1] == [1, 11] }.each do |card|
    higher_sum = total + card[1][1]

    if higher_sum <= 21
      total += card[1][1]
    else
      total += card[1][0]
    end
  end
  total
end

def bust?(hand)
  calculate(hand) > 21
end

def player_turn(deck, player1, player2)
  loop do
    puts 'Do you want to hit, or stay?'
    answer = gets.chomp
    if answer.downcase.start_with?('h')
      deal_one(deck, player1)
      display_player_hand(player1, player2)
      break if bust?(player1)
    else
      break
    end
  end
end

def computer_turn(deck, player1, player2)
  loop do
    if calculate(player2) < 17
      deal_one(deck, player2)
      display_computer_hand(player1, player2)
    else
      break
    end
  end
end

def bust_loss(player1, player2)
  if bust?(player1)
    puts "Your hand: #{calculate(player1)}; Dealer hand: #{calculate(player2)}"
    puts 'Dealer wins.'
  end
  if bust?(player2)
    puts "Your hand: #{calculate(player1)}; Dealer hand: #{calculate(player2)}"
    puts 'You win!'
  end
end

def winner(player1, player2)
  if calculate(player1) > calculate(player2)
    puts "Your hand: #{calculate(player1)}; Dealer hand: #{calculate(player2)}"
    puts 'You win!'
  elsif calculate(player2) > calculate(player1)
    puts "Your hand: #{calculate(player1)}; Dealer hand: #{calculate(player2)}"
    puts 'Dealer wins.'
  else
    puts "Your hand: #{calculate(player1)}; Dealer hand: #{calculate(player2)}"
    puts "It's a push."
  end
end

puts "Welcome to the 21 game!"
sleep(2)
card_deck = initialize_deck
loop do
  player_hand = []
  computer_hand = []

  opening_deal(card_deck, player_hand, computer_hand)
  display_player_hand(player_hand, computer_hand)
  player_turn(card_deck, player_hand, computer_hand)
  display_computer_hand(player_hand, computer_hand)
  if bust?(player_hand)
    bust_loss(player_hand, computer_hand)
  else
    computer_turn(card_deck, player_hand, computer_hand)
    if bust?(computer_hand)
      bust_loss(player_hand, computer_hand)
    else
      winner(player_hand, computer_hand)
    end
  end
  puts 'Play again? (y/n)'
  answer = gets.chomp
  break if answer.start_with?('n')
end
