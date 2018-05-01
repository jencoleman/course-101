require 'pry'
def prompt(input)
  puts("=> #{input}")
end

def valid_amount?(input)
  true if input.to_f.to_s == input
end

def fix_amount(amount)
  array = amount.split('')
  if array[0] == '$'
    array.shift
  end
  if array.include?','
    array.delete(',')
  end
  array.join('')
end

def fix_apr(num)
  array = num.split('')
  if array.last == '%'
    array.pop
  end
  array = (array.join('').to_f * 0.01).to_s.split('')
  array.join('')
end

amount = nil
apr = nil
duration = nil
monthly_payment = nil
years = nil

loop do
  prompt('Welcome to the mortgage calculator!')
  prompt('To calculate your monthly payment, I need some information.')
  loop do
    prompt('What is the total amount of the loan?')
    amount = gets.chomp
    amount = fix_amount(amount)
    if amount.to_f < 0 || amount.empty?
      prompt('Try again! Please input a positive number.')
    else
      break
    end
  end
  loop do
    prompt('What is the APR? Enter as percentage, example: 3.25%')
    input = gets.chomp
    apr = fix_apr(input)
    if apr.to_f < 0 || input.empty?
      prompt('Try again! Please input a positive number.')
    else
      break
    end
  end
  loop do
    prompt('How many years will you have the loan for?')
    years = gets.chomp
    if years.to_f < 0 || years.empty?
      prompt('Try again! Please input a positive number.')
    else
      break
    end
  end
  mir = (apr.to_f / 12)
  duration = years.to_f * 12
  monthly_payment = amount.to_f * (mir / (1 - (1 + mir)**-duration))
  prompt('Calculating...')
  sleep 1
  prompt("Your monthly interest rate is #{(mir * 100).round(2)}%, and your ")
  prompt("loan duration is #{duration.to_i} months.")
  prompt("Your monthly payment is $#{monthly_payment.round(2)}.")
  prompt('Would you like to do another calculation? Please answer y/n.')
  again = gets.chomp.downcase
  break if again.start_with?('n')
end
prompt('Thank you for using the mortgage calculator. Goodbye!')
