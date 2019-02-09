
#handle add
def add(num1,num2)
   add_sum = (num1+num2)
  "#{num1} + #{num2} = #{add_sum}"
end
#handle subtract
def subtract(num1,num2)
  sub_sum = (num1-num2)
  "#{num1} - #{num2} = #{sub_sum}"
end
#handle sum
def sum(arr)
  sum = 0
  arr.each {|num| sum+=num}
  "The sum of all the following numbers: #{arr} is #{sum}"
end
#handle multiply
def multiply(num1,num2)
  multi_sum = (num1*num2)
  "#{num1} x #{num2} = #{multi_sum}"
end
#handle power (its over 9000)
def power(num1,num2)
    power_sum = (num1**num2)
power_sum < 9000 ? "#{num1} in power of #{num2} equals #{power_sum}" : "#{num1} in power of #{num2} equals #{power_sum} IT'S OVER 9000!!!!!!"
end
#handle factorial
def factorial(num)
    if num ==0
      fact_sum = 1
    else
      num_array = (1..num).to_a
      fact_sum = 1
      num_array.each { |num| fact_sum*=num}
  "The factorial number of #{num} is #{fact_sum}"
    end
end


#handle display
puts "Hi there, What Method you want to use ?(add,substract,sum,multiply,power,factorial)"
action = gets.chomp

case action
  when "add"
    puts "Alright, give me the first number"
    add_num1 = gets.chomp.to_i
    puts "And what number you want me to add?"
    add_num2 = gets.chomp.to_i
    puts add(add_num1,add_num2)
  when "subtract"
    puts "Alright, give me the first number"
    sub_num1 = gets.chomp.to_i
    puts "And what how much you want me to subtract?"
    sub_num2 = gets.chomp.to_i
    puts subtract(sub_num1,sub_num2)
  when "sum"
    puts "Alright give me all the numbers separated with a space(like so: x y z)"
    numbers_arr = gets.chomp.split(' ').map {|num| num.to_i}
    puts sum(numbers_arr)
  when "multiply"
    puts "Alright, give me the first number"
    multi_num1 = gets.chomp.to_i
    puts "Now give me the number you want me to multiply by"
    multi_num2 = get.chomp.to_i
    puts multiply(multi_num1,multi_num2)
  when "power"
    puts "Alright, give me the first number"
    power_num1 = gets.chomp.to_i
    puts "In power you want me to raise thhat number?"
    power_num2 = gets.chomp.to_i
    puts power(power_num1,power_num2)
  when "factorial"
    puts "Alright,Give me a positive number you want me to find the factorial of?"
    fact_num = gets.chomp.to_i
    puts factorial(fact_num)
end

