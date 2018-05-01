def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end
def win?(first, second)
  case first
    when 

def lose?(first, second)
  (second == 'rock' && first == 'scissors') ||
    (second == 'paper' && first == 'rock') ||
    (second == 'scissors' && first == 'paper')
end

def display_results(first, second)
  case win?(first, second)
    prompt('You won!')
  elsif lose?(first, second)
    prompt('You lose!')
  else
    prompt('It is a tie!')
  end
end

VALID_CHOICES = %w(rock paper scissors lizard spock)
loop do
  computer_choice = VALID_CHOICES.sample
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  prompt("You chose #{choice}; computer chose: #{computer_choice}")
  display_results(choice, computer_choice)
  prompt('Do you want to play again? y or n')
  play_again = Kernel.gets().chomp().downcase()
  break unless play_again.start_with?('y')
end
prompt('Thanks for playing. Good bye!')
