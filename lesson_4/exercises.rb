#loops 1
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  if nummber_a == 5 || number_b == 5
    puts '5 was reached!'
  else
    next
  end
end
=begin
friends = ['Sarah', 'John', 'Hannah', 'Dave']
friends.each { |friend| puts "What up, #{friend}!" }
=begin
for i in 1..10
 next if i.even?
puts i
end
numbers = [7, 9, 13, 25, 18]

until numbers.size == 0
  puts numbers.shift
end
count = 0

until count > 10
  puts count
  count += 1
end
numbers = []

while numbers.size < 5
  num = rand(99)
  puts num
  numbers.push(num)
end
say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false  if counter > 4
end
loop do
  puts 'Just keep printing...'
  break
end
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end
=end
