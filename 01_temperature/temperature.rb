#converts c to f
def c_to_f(c)
  ((c*9/5) + 32).floor
end

#converts f to c
def f_to_c(f)
  ((f-32)*5/9).floor
end

puts "What temperture you wish to convert? c/f"
answer = gets.chomp

puts "Alright give me the number"
temp = gets.chomp.to_i

case answer
when "c" then puts "The temperture is #{c_to_f(temp)}F"
when "f" then puts "The temperture is #{f_to_c(temp)}C"
else puts "Sorry mate, I only convert C to F or F to C"
end