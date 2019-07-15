class Player 
  attr_accessor :name , :figure

  def name=(name)
    @name = name
  end

  def figure=(figure)
    @figure = figure
  end

  def figure
    @figure
  end

  def name
    @name
  end

end

class Board
  $board = ['1','2','3','4','5','6','7','8','9']

  def board
    $board
  end

  def display_board
    puts " #{$board[0]} | #{$board[1]} | #{$board[2]} "
    puts "---+---+---"
    puts " #{$board[3]} | #{$board[4]} | #{$board[5]} "
    puts "---+---+---"
    puts " #{$board[6]} | #{$board[7]} | #{$board[8]} "
    puts "\n"    
  end

  def player_move(player,move,board)
    if $board[move - 1] != @figure
      board[move - 1] = player.figure
      $new_board.check_winner($board,player)
      if $new_board.check_winner($board,player)
        puts "#{player.name} WINS!"
      end
    end
     $turn_count += 1
  end

  def colorize(text, color)
    "\e[#{color == 'red' ? 31 : 32}m#{text}\e[0m"
  end

  def check_winner(board,player)
    win_cond = [
      [1,2,3],[4,5,6],[7,8,9],
      [1,4,7],[2,5,8],[3,6,9],
      [1,5,9],[3,5,7]
    ]
    win = false
    win_cond.each {|condition|
      count = 0
      condition.each {|position|
        count +=1 if board[position - 1] == player.figure
      }
      win = true if count == 3
    }
    win
  end

end


class Screen
  def greeting
    puts "######### Tic Tac Toe ##########"
    puts "#########  Game Rules  #########"
    puts "## two players, X and O, who  ##"
    puts "##  take turns marking the    ##"
    puts "## spaces in a 3×3 grid. The  ##"
    puts "##  player who succeeds in    ##"
    puts "##   placing three of their   ##"
    puts "##    marks in a horizontal,  ##"
    puts "## vertical, or diagonal row  ##"
    puts "##      wins the game.        ##"
    puts "################################"
  end

  def set_data
    puts "Player 1, What's your name ? "
    $p1.name = gets.chomp
    puts "\n"
    puts "Choose your weapon  X / O"
    $p1.figure = gets.chomp.upcase
    $p2.figure = $p1.figure == 'X'   ? 'O' : 'X'
    puts "#{$p1.name}'s weapon is : #{$p1.figure}"
    puts "\n"
    puts "Player 2, What's you name ? "
    $p2.name = gets.chomp 
    puts "\n"
    puts "#{$p2.name}'s weapon is #{$p2.figure}"
    puts "\n"
  end

  def whos_first
    if $p1.figure == 'X'
      puts "#{$p1.name} attacks first"
    else
      puts "#{$p2.name} attacks first"
      $turn_count = 1
    end
    puts "\n"
  end

  def turn
    puts "Its #{$whos_turn.name}'s turn"
    puts "Give me a number of available square to hit"
    $new_board.player_move($whos_turn,gets.chomp.to_i ,   $board)
    $new_board.display_board
  end
  
end


def reset_game
  $new_board = Board.new
  new_screen = Screen.new
  new_screen.greeting
  $p1 = Player.new
  $p2 = Player.new
  new_screen.set_data
  $turn_count = 0
  $whos_turn = $turn_count % 2 == 0 ? $p1 : $p2 
  new_screen.whos_first
  $new_board.display_board

   while !$new_board.check_winner($board, $whos_turn)
    $whos_turn = $turn_count % 2 == 0 ? $p1 : $p2
    new_screen.turn
  end
end


class Game
  reset_game
  puts "Another round ? Y / N"
  answer = gets.chomp.upcase
  while answer == "Y"
    reset_game
  end
  
  puts "THANK YOU FOR PLAYING"
end 


Game.new  


