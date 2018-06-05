customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
]
fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]


#Problem 16
def my_uuid
  id = ''
  chars = [*(0..9), *('a'..'f')]
  32.times do
    id << chars.sample.to_s
  end
  return "#{id[0..7]}-#{id[8..11]}-#{id[12..15]}-#{id[16..19]}-#{id[20..31]}"
end
puts my_uuid
  

=begin
# Problem 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

var = arr.select do |hash|
  hash.values.flatten.all? { |num| num.even? }
end
puts var.inspect
    

=begin
#Problem 14 
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

answer = []
hsh.each do |k, v|
  answer.push(v[:colors].map { |val| val.capitalize }) if v[:type] == 'fruit'
  answer.push(v[:size].upcase) if v[:type] == 'vegetable'
end
puts answer.inspect

=begin
#Problem 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

var = arr.sort do |a, b|
  case
    when a[0].odd? && b[0].odd?
      a <=> b
    when a[1].odd? && b[1]
  end
end
puts var.inspect
  

=begin
#Problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

var = {}
arr.map do |arr|
  var[arr[0]] = arr[1]
end
puts var.inspect
=begin
#Problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
var = arr.map do |arr|
  arr.select { |integer| integer%3 == 0 }
end

puts var.inspect

=begin
#Problem 10
var = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
 hsh.map { |k, v| (k, (v += 1)) }
end
puts var.inspect
=begin
#Problem 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

puts arr1[2][1][3]
puts arr2[1][:third][0]
puts arr3[2][:third][0][0]
puts hsh1['b'][1]
puts hsh2[:third]

=begin
#Problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

var = books.sort do |a, b|
  a[:published].to_i <=> b[:published].to_i
end
puts var.inspect

=begin
#Problem 1
arr = ['10', '11', '9', '7', '8']

variable = arr.sort do |a,b|
  b.to_i <=> a.to_i
end
puts variable.inspect
=end

