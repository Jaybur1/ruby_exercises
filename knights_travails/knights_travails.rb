class Knight 
  attr_accessor :position, :target, :parent, :children
  def initialize(position, parent = nil)
    @position = position
    @parent = parent 
    @children = []
  end
end

class Move

  def moves(position)
    
    posible_moves = Array.new
    posible_moves.push(
      [position[0] + 2, position[1] + 1],
      [position[0] + 2, position[1] - 1],
      [position[0] - 2, position[1] + 1],
      [position[0] - 2, position[1] - 1],
      [position[0] + 1, position[1] + 2],
      [position[0] + 1, position[1] - 2],
      [position[0] - 1, position[1] + 2],
      [position[0] - 1, position[1] - 2]
      )

      posible_moves = posible_moves.select {|move|
        move[0].between?(0,7) && move[1].between?(0,7)
      }
      posible_moves
  end

  def bfs(knight, target)
    queue_arr = [knight]

    until queue_arr.empty?
      current = queue_arr.shift
      return current if current.position == target
      queue_arr += current.children
    end
  end

  def knight_moves(start,target)
    positions = [start]
    knight_start_point = Knight.new(start)
    queue_arr = [knight_start_point]

    until positions.include?(target)
      current = queue_arr.shift
      pos_moves = moves(current.position)
      
      pos_moves.each {|move|
        unless positions.include?(move)
          positions << move 
          next_knight_pos = Knight.new(move,current)
          current.children << next_knight_pos
          queue_arr << next_knight_pos
        end
      }
    end

    pos_history = Array.new
    knight = bfs(knight_start_point, target)

    until knight.parent.nil?
      pos_history.unshift(knight.position)
      knight = knight.parent
    end

    pos_history.unshift(start)

    output = "It took #{pos_history.size - 1} moves to get to the target \n Here are the moves:\n start point => "
    pos_history.each {|move|
      move == pos_history[-1] ? output << "#{move}" : output << "#{move} ~> "
    }
    
    output << " <= target"
    puts output
  end
end

move = Move.new

move.knight_moves([0,0],[3,3])
move.knight_moves([0,0],[3,3])
move.knight_moves([3,3],[7,7])
move.knight_moves([5,5],[0,0])
move.knight_moves([0,0],[7,7])


