# ask user for two numvers
#ask for an operation
#perform operation
#output results

Kernel.puts("Welcome to the calculator! Type the first number: ")
number1 = Kernel.gets().chomp()
Kernel.puts("Type the second number: ")
number2 = Kernel.gets().chomp()
Kernel.puts("What operation would you like to perform? 1) add, 2) subtract, 3) multiply, 4) divide?")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
else
  result = number1.to_f / number2.to_f
end

Kernel.puts(result.to_s)
