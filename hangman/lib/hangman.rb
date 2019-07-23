require 'yaml'

class Dictionary  
  @@file = File.readlines "5desk.txt"

  def pick_word
  @@file[rand(@@file.length)].downcase.gsub(/[\n\r]/,"")
  end
end

class Screen
##screen class:
#display and set options (load or start new)
  attr_reader :phrase_arr
  def initialize 
    @phrase_arr = ["Hit me", "You can do it !","Save the hangman", "You know this!"]
  end
  def greeting
    puts "################## HANGMAN #######################"
    puts "######### Game Rules & Instructions ##############"
    puts "##################################################"
    puts "###### Your objective is to guess the secret #####"
    puts "######## word that will be represented with ######"
    puts "######## \"-\" for every letter of the word ########"
    puts "######## for example: for the word \"hello\" #######"
    puts "############ you will see \"- - - - -\" ############"
    puts "##### the letters in the hidden word will be  ####"
    puts "##### revealed according to your correct guess ###"
    puts "###### example: if you guessed the letter \"e\" ####"
    puts "############## for the word \"hello\" ##############"
    puts "###### the hidden word will show:\"- e - - -\" #####"
    puts "########## in case your guess was wrong ##########"
    puts "####### your fail count will go up and the #######"
    puts "#### hangman figure will add an element to it ####"
    puts "# in any moment, you can try to guess the whole ##"
    puts "### word ,for correct guess you win the round ####"
    puts "############ else you lose a fail ################"
    puts "### overall, you have 9 fails utill the hangman ##"
    puts "###### figure will reveal it self completly ######"
    puts "############## if it does, you LOSE. #############"
    puts "#### for example: for 3 fails left the hangman ###"
    puts "############## will be like this: ################" 
    puts "##################################################"
    puts "           #{display_hangman(6)}"
    puts "##################################################"
    puts "####### either way for every try you will ########"
    puts "##### see the used letters, so you don't need ####"
    puts "#### to remember the letters you allready used ###"
    puts "############### INPUT Options :###################"
    puts "############# 1) <options - see options ###########"
    puts "############# 2) <save - saves progress ###########"
    puts "** DONT FORGET TO PUT < BEFORE ANY OPTION YOU PUT *"
    puts "*************** INSTEAD OF GUESSING ***************"
    puts "*SO THE SYSTEM WILL NOT CONFUSE IT WITH THE SECRET*"
    puts "******* NOT CONFUSE IT WITH THE SECRET WORD *******"
    puts "#################### SCORING #####################"
    puts "#1) for correct letter guess you score 10 points #"
    puts "#2) for correct whole word guess you get: ########"
    puts "################### 100 points ###################"
    puts "####################    +     ####################"
    puts "###### 10 points for each letter of the word #####"
    puts "##################################################"
    puts "#################### GOOD LUCK ###################"
    puts "##################################################"
    puts "\n"
  end

  def start_game_options
    puts "Select an option( new / load )"
    answer = gets.chomp.downcase

    answer
  end

  def display_hangman(fail)
    fail_1 = "               ____________"
    fail_2 = "               | /        |"
    fail_3 = "               |/         |"
    fail_4 = "               |          O"
    fail_5 = "               |          |"
    fail_6 = "               |         /|"
    fail_7 = "               |         /|\\"
    fail_8 = "               |         / "
    fail_9 = "               |         / \\"
    end_game = "              //_____________"

    case fail
    when 1 then puts "#{fail_1}\n\n\n\n\n\n\n\n"
    when 2 then puts "#{fail_1}\n#{fail_2}\n\n\n\n\n\n\n"
    when 3 then puts "#{fail_1}\n#{fail_2}\n#{fail_3}\n\n\n\n\n\n"
    when 4 then puts "#{fail_1}\n#{fail_2}\n#{fail_3}\n#{fail_4}\n\n\n\n\n"
    when 5 then puts "#{fail_1}\n#{fail_2}\n#{fail_3}\n#{fail_4}\n#{fail_5}\n\n\n\n"
    when 6 then puts "#{fail_1}\n#{fail_2}\n#{fail_3}\n#{fail_4}\n#{fail_6}\n\n\n\n"
    when 7 then puts "#{fail_1}\n#{fail_2}\n#{fail_3}\n#{fail_4}\n#{fail_7}\n\n\n\n"
    when 8 then puts "#{fail_1}\n#{fail_2}\n#{fail_3}\n#{fail_4}\n#{fail_7}\n#{fail_8}\n\n\n"
    when 9 then puts "#{fail_1}\n#{fail_2}\n#{fail_3}\n#{fail_4}\n#{fail_7}\n#{fail_9}\n#{end_game}\n\n"
    else puts "\n\n\n\n\n\n\n\n\n"
    end
  end

  def display_output(output, used, tries ,score)
    puts "Secret word : #{output.join(' ')}"
    puts "\n"
    puts "Used letters : #{used}"
    puts "\n"
    puts "Fails remain: #{9 - tries}"
    puts "\n"
    puts "score : #{score}"
    puts "\n"
  end

  def pick_option
    puts "pick an option (no need to add < here)"
    puts "* rules - show rules"
    puts "* save - save progress"
    puts "* main - main manu"
    puts "* back - back to game"

    answer = gets.chomp.downcase
    answer
  end

  def phrase_arr=
    @phrase_arr
  end

end


class Game
  #update the data accordingly
  #update output
  #check if guessed
  #save data to crv file
  #score, update

  attr_accessor :game_data
  
  def initialize(game_data = {
    secret_word: '',
    hidden: {},
    tries: 0,
    output: [],
    used: []
    })
    @game_data = game_data
  end
  
  def update_output(word,hash)
    word.each_with_index {|letter,i|
      hash[:hidden][letter] ? hash[:output][i] = '-' : hash[:output][i] = letter
     }
  end

  def set_hidden(word, hash)
    word.each {|letter|
    hash[:hidden][letter] = true
    }
    rand(1..3).times {
      hash[:hidden][word[rand(word.length)]] = false
    }
  end

  def used?(letter,used)
    used.include? letter
  end

  def handle_input(letter, word, hash, screen ,game)
    def back_to_game(game,screen,hash)
      screen.display_output(hash[:output],hash[:used],hash[:tries],hash[:score])
      play_round(hash, game, screen)  
    end

    case letter
    when '<options'
      option = screen.pick_option
      case option
      when 'rules'
        puts "\n"
        show_saved
        screen.greeting
        back_to_game(game, screen, hash)
      when 'save'
        puts "\n"
        puts "saving..."
        save_game(hash)
        puts "Game saved"
        puts "\n"
        back_to_game(game, screen, hash)
      when 'main'
        pre_game_set
      when 'back'
        puts "\n"
        back_to_game(game, screen, hash)
      end
    when '<save'
        puts "\n"
        puts "saving..."
        save_game(hash)
        puts "Game saved"
        puts "\n"
        back_to_game(game, screen, hash)
    else  
      if letter.length > 1 && letter[0] != "<"
        if guessed?(letter.split('') , hash[:secret_word])
          letter.split('').each {|l|
            hash[:hidden][l] = false
          }
          hash[:score] += (100 + (10 * letter.length))
          puts "Great guess"
        else
          hash[:tries] += 1
          hash[:used] << letter
          puts "Wrong ..."
        end
      else
        if word.include? letter
          hash[:hidden][letter] = false
          hash[:used] << letter
          hash[:score] += 10
        else
          hash[:tries] += 1
          hash[:used] << letter
          puts "not there"
        end
      end
    end
  end

  def update_game_data(hash,letter,screen,game)
    word = hash[:secret_word].split('')
    handle_input(letter, word, hash,screen,game)
    update_output(word, hash)
    @game_data = hash 
  end

  def guessed?(output,secret_word)
    output.join('') == secret_word
  end

  def play_round(data_hash,game,screen)
    puts "#{screen.phrase_arr[rand(4)]}, give me a letter:"
    puts "\n"
    guess = gets.chomp

    while data_hash[:used].include? guess
      puts "You used that letter, try another one :"
      guess = gets.chomp
    end 
    puts "------------------------------------------------------" 
    puts "\n"
    game.update_game_data(data_hash,guess,screen,game)

    puts"\n"
    screen.display_output(data_hash[:output],data_hash[:used],data_hash[:tries],data_hash[:score])
    puts "------------------------------------------------------"
    puts "-------------The Hangman will upear here--------------"
    screen.display_hangman(data_hash[:tries])
    puts "------------------------------------------------------"
    puts "\n"   
  end

  def continue_to_next_round

  end

  def save_game(data_hash)

  File.open('save.yml', 'w') {|file| file.write([data_hash].to_yaml)}
  end

  def load_game
    if File.exist? 'save.yml'
      hash = YAML.load(File.read('save.yml'))
      @game_date = hash[0]
    else
      "no saved file"
      pre_game_set
    end 
  end

  def game_data=
     @game_data
  end

  def load_game_data(hash)
    @game_data = hash
  end
end



def start_round(screen,game,load = false)
  data_hash = game.game_data

  ############ default data #############
  #{                                    #
  #  secret_word: dictionary.pick_word, #
  #  hidden: Hash.new,                  #
  #  tries: 0,                          #
  #  output: Array.new,                 #
  #  used: Array.new,                   #
  #  score: 0 
  # }                                   #
  #######################################

  #set game##########################
  game.set_hidden(data_hash[:secret_word].split(''),  data_hash) unless load
  
  game.update_output(data_hash[:secret_word].split(''),data_hash)
  screen.display_output(data_hash[:output],data_hash[:used],data_hash[:tries],data_hash[:score])

  guessed = false
  ###########################

  while data_hash[:tries] < 9 
    game.play_round(data_hash,game,screen)
    guessed = game.guessed?(data_hash[:output], data_hash[:secret_word])
    break if guessed
  end

  if data_hash[:tries] == 9 && !guessed
    puts "GAME OVER ... start over ?  y / n ?"
    answer = gets.chomp.downcase

    answer == 'y' ? pre_game_set : 'Thanks for playing'
    else
    puts "Nice play Champ! continue scoring ? y / n"
    answer = gets.chomp.downcase 
    answer == 'y' ? continue_score(data_hash[:score]) : 'Hope to see you soon!'
    puts "\n"
  end
end

def continue_score(score)
  screen = Screen.new
  game = Game.new
  puts "\n"

  dictionary = Dictionary.new
  game.game_data[:secret_word] = dictionary.pick_word
  game.game_data[:score] = score
  start_round(screen, game)
end


def pre_game_set
  screen = Screen.new
  game = Game.new
  screen.greeting
  puts "\n"
  select = screen.start_game_options.downcase
  case select
  when "new" 
    dictionary = Dictionary.new
    game.game_data[:secret_word] = dictionary.pick_word
    start_round(screen, game)
  when "load"
    game.load_game_data(game.load_game)
    p game.game_data[:score]
    start_round(screen, game, true)
  end
end

#test##
pre_game_set


#Live demo: https://repl.it/@Jaybur1/Hangman