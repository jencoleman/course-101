#additional practice

h = { "a" => 100, "b" => 200, "c" => 300 }
value = h.select! {|k,v| v > 50} 
puts value.inspect

=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.each do |key, info|
  if info['age'] < 18
    info['age_group'] = 'kid'
  elsif info['age'] < 65
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'senior'
  end
end
puts munsters.inspect
    
=begin
Problem 9
def titleize(string)
  new = []
  string.split.each { |word| new.push(word.capitalize) }
  return new.join(' ')
end
words = "the flintstones rock"
puts titleize(words)

=begin
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
#Problem 7
statement = "The Flintstones Rock"
hash = {}
statement.split('').each do |let| 
  next if let == ' '
  if hash[let] == nil
    hash[let] = 1
  else
    hash[let] += 1
  end
  
end
puts hash

=begin
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |str| str[0, 3] }
puts flintstones

=begin
#Problem 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.keep_if { |string| string == /\Be*/ }


=begin
#Problem 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
least = nil
ages.values.each do |num|
  if least == nil || num < least
    least = num
  end
end

puts least
  

=begin
Problem 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.select { |k, v| v < 100 }


=begin
# Problem 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.inject(:+)

=begin
#Problem 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint = {}

flintstones.each_with_index do |item, index|
  flint[item] = index
end
puts flint.inspect
  
  

#Problem 1
#[1, 2, 3]

#Problem 2
# 2

#Problem 3
# [1, 2, 3]
=end

