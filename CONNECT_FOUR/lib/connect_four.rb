require_relative "Board.rb"
require_relative "Player.rb"

class Game 

  def colorize(text, color)
    "\e[#{color == 'red' ? 31 : 32}m#{text}\e[0m"
  end

  def welcome(board)
    puts "############ Connect Four ###############"
    puts "################ Rules ##################"
    puts "## The players take turns dropping one ##"
    puts "### colored disc from the top into a ####"
    puts "# seven-column, six-row vertically ######"
    puts "# suspended grid. The pieces fall #######"
    puts "# straight down, occupying the lowest ###" 
    puts "# available space within the column. ####"
    puts "# The objective of the game is to be the#" 
    puts "# first to form a horizontal, vertical, #"
    puts "# or diagonal line of four of one's own #"
    puts "# discs. Connect Four is a solved game. #"
    puts "# The first player can always win by ####"
    puts "#######playing the right moves.##########"
    puts "#########################################"
    puts "each turn the player will choose a column"
    puts "######to drop his disk piece in##########"
    puts "#like in the example below, the columns #"
    puts "marked by numbers, so if you want to drop"
    puts "#your disk piece in column number 4, you#"
    puts "#### enter the number 4 on your turn ####"
    puts "\n"
    puts "#{board.display}"
    puts "#########################################"
    puts "############# GOOD LUCK !!! #############"
    puts "\n"
  end


  def column_pick(board)
    puts "Choose a column to drop the disc"
    answer = gets.chomp.to_i

    if answer > 7 || answer  < 1
      puts "invalid choice, please pick between 1 - 7"
      answer = gets.chomp.to_i
    end

    answer
  end

  def make_turn(player, column, board)
    board.update(player,column)
   puts board.display
  end
end


def game_on
  game = Game.new
  board = Board.new
  board.create 

  turn_count = 0 # max 42

  game.welcome(board)
  puts "Player 1 , whats your name ?"
  puts "\n"
  p1 = Player.new(game.colorize("\u26Ab", "red"),gets.chomp)
  puts "Great! #{p1.name}, you will be the red disc => #{p1.figure}"
  puts "\n"
  puts "Player 2 , whats your name ?"
  puts "\n"
  p2 = Player.new(game.colorize("\u26Ab", "green"),gets.chomp)
  puts "Great! #{p2.name}, you will be the green disc => #{p2.figure}"
  puts "\n"
  
 
  who_wins = nil
  winner = false 
  while turn_count <= 42
    whos_turn = turn_count % 2 == 0 ? p1 : p2

    puts "I'ts your turn, #{whos_turn.name}"
    game.make_turn(whos_turn.figure, game.column_pick(board), board)
    winner = board.check_winner(whos_turn.figure)
    winner
    if winner
      who_wins = whos_turn
      break
    end

    turn_count += 1
  end


  if winner
    puts "Congratz, #{who_wins.name}, YOU WON THE GAME!!!"
  else
    puts "ITS A TIE"
  end
end


game_on