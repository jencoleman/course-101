require 'pry'

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # columns
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # rows
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(text)
  puts "=> #{text}"
end

def display_board(brd)
  system 'clear'
  puts ""
  puts "     |     |"
  puts " #{brd[1]}   |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[4]}   |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[7]}   |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd), '; ', 'and')}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def joinor(array, punc=', ', other='or')
  if array.length == 1
    "#{array[0]}"
  elsif array.length == 2
    "#{array[0]} or #{array[1]}"
  else
    cap = array.pop.to_s
    first_part = array.join(punc)
    first_part + punc + other + ' ' + cap
  end
end
def defense(brd)
  WINNING_LINES.sample do |line|
    brd.values_at(*line).count(PLAYER_MARKER) > 1
  end
  binding.pry
end

def computer_places_piece!(brd)
  endangered = defense(brd)
  if endangered.index(INITIAL_MARKER)
    brd[endangered.index(INITIAL_MARKER)] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end



prompt('Welcome to tic tac toe!')
loop do
  computer_wins = 0
  player_wins = 0
  prompt("You're an X, computer is O.")
  prompt("First to five is the winner.")
  loop do
    board = initialize_board
    display_board(board)
    loop do
      player_places_piece!(board)
      break if board_full?(board) || someone_won?(board)
      computer_places_piece!(board)
      display_board(board)
      break if board_full?(board) || someone_won?(board)
    end
  
    display_board(board)
  
    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
      player_wins += 1 if detect_winner(board) == 'Player'
      computer_wins += 1 if detect_winner(board) == 'Computer'
    else
      prompt("It's a tie!")
    end
    prompt("The score is: Player - #{player_wins}, Computer - #{computer_wins}")
    if computer_wins == 5 || player_wins == 5
      prompt("#{detect_winner(board)} won the best of 5!")
      prompt("Do you want to re-set the scores? (y or n)")
      reset = gets.chomp
      if reset.downcase.start_with?('y')
        player_wins = 0
        computer_wins = 0
      end
    end
    prompt("Do you want to play again? (y or n)")
    answer = gets.chomp
    break if answer.downcase.start_with?('n')
  end
  break
end
prompt('Thanks for playing tic tac toe. Goodbye!')
