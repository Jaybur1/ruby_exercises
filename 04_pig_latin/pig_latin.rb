#handle translate
def translate(str)
    str_arr = str.split
    pig_latin = Array.new
    str_arr.each do |word|
#handle word starts whit a vowel
      if word.start_with?(/[aeiou]/)
        word << "ay"
        pig_latin << word
#handle qu
     elsif word.include? "qu"
        cons = word.index(/[aeio]/,0)
        word = "#{word[cons..-1]}#{word[0..(cons-1)]}ay"
        pig_latin << word
#handle capitalized word
     elsif word.start_with?(/[A-Z]/)
        word.downcase!
        cons = word.index(/[aeiou]/,0)
        word = "#{word[cons..-1]}#{word[0..(cons-1)]}ay"
        pig_latin << word.capitalize!
#handle a word that starts with a consonant sound
     elsif word =~ /[aeiou]/
        cons = word.index(/[aeiou]/,0)
        word = "#{word[cons..-1]}#{word[0..(cons-1)]}ay"
        pig_latin << word
#handle word without any vowels
     else
        word = "#{word}way"
        pig_latin << word
      end

    end
    pig_latin.join(' ')
end


puts translate("squalify Computer aloooo")


#remove the comment tags to get interactive console in the terminal
=begin
#handle display
puts "===Pig Latin==="
puts "Give me some stuff to translate OYK"
answer = gets.chomp
puts translate(answer)
=end