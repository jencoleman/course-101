#select letter
def select_letter(string, char)
  counter = 0
  answer = []
  
  loop do
    break if counter == string.length
    current_char = string[counter]
    answer.push(current_char) if current_char == char
    counter += 1
  end
  return answer
end

question = 'How many times does a particular character appear in this sentence?'
puts select_letter(question, 'a').inspect
puts select_letter(question, 't').inspect
puts select_letter(question, 'z').inspect

=begin
#array multiplier problem
def multiply(array, multiplier)
  counter = 0
  new_array = []
  loop do
    break if counter == array.length
    new_array[counter] = array[counter] * multiplier
    counter += 1
  end
  return new_array
end
my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3).inspect

#double odd numbers
def double_odd_numbers(array)
  array.each_with_index { |item, index| array[index] *= 2 if index.odd? }
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)
puts my_numbers.inspect

def double_odd!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2 if counter.odd?
    counter += 1
  end
  numbers
end
array = [1, 2, 3]
puts double_odd!(array).inspect
puts array.inspect

def double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end
  numbers
end
array = [1, 2, 3]
puts double_numbers(array).inspect
puts array.inspect

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size      

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce).inspect
=end