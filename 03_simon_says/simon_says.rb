#handle echo
def echo(str)
  str
end

#handle shout
def shout(str)
str.upcase!
end

#handle repeat
def repeat(str,num = 2)
    repeat_str = Array.new
    num.times {repeat_str << str}
    repeat_str.join(" ")
end

#handle start of word
def start_of_word(str,index)
    if str.length > 1
       str.slice(0,index)
    else
    alphabet= ("a".."z").to_a
    alphabet_seq = ("a"..alphabet[index]).to_a
    alphabet_seq.join
    end
end


#handle first word
def first_word(str)
    str_arr = str.split(" ")
    str_arr[0]
end

#handle titleize
def titleize(str)
    str_arr = str.split
    little_words = ["and", "the", "over", "is","has","was"]
    str_arr[0].capitalize!
    str_arr.each {|word| word.capitalize! if little_words.index(word) == nil }
    str_arr.join(" ")
end

# handle display
#delete the =begin and =end to see interactive console in your terminal
=begin
puts "Welcome to simon says game! \nPlease, write a choice of action"
puts "echo\nshout\nrepeat\nstart of word\nfirst word\ntitleize"
action = gets.chomp

case action
  when "echo"
    puts "Give me something to echo"
    echo_str = gets.chomp
    puts echo(echo_str)
  when "shout"
    puts "Give me something to shout"
    shout_str = gets.chomp
    puts shout(shout_str)
  when "repeat"
    puts "Give me something to repeat"
    repeat_str = gets.chomp
    puts "How many times you want me to repeat?"
    repeat_num = gets.chomp.to_i
    puts repeat(repeat_str,repeat_num)
  when "start of word"
    puts "Give me a word please"
    strat_of = gets.chomp
    puts "how many of that latter do you want me to show?"
    start_of_num = gets.chomp.to_i
    puts start_of_word(start_of,start_of_num)
  when "titleize"
    puts "Give me something to titleize"
    title = gets.chomp
    puts titleize(title)
  else "Sorry mate, I don't know that action."
end
=end