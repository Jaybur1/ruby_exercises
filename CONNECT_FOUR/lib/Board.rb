class Board
  attr_accessor :rows, :columns, :data

  def initialize
    @rows = 6
    @columns = 7
    @data = Hash.new
  end

  def create 
    row = 1
    until row > @rows
      @data["row_#{row}".to_sym] = Array.new(@columns)
      row += 1
    end
  end

  def display
    top = " - 1 - 2 - 3 - 4 - 5 - 6 - 7 - "
    spliter = " - - - - - - - - - - - - - - - "
    output = "#{top}\n#{spliter}\n "
    row = 1
    until row > @rows
      @data["row_#{row}".to_sym].each_with_index {|pos, i|
        if i == @data["row_#{row}".to_sym].length - 1
          pos.nil? ? output << "| _ |" : output << "| #{pos} |"
        else
          pos.nil? ? output << "| _ " : output << "| #{pos} "
        end
      }
      
      output << "\n#{spliter}\n "
      row += 1
    end

    output
  end

  def update(player, column)
    row = 6
    until @data["row_#{row}".to_sym][column - 1].nil? || row == 1
      row -= 1
    end 
    if row == 1 && !@data["row_#{row}".to_sym][column - 1].nil?
      puts "Sorry, this one is full try another one"
      answer = gets.chomp.to_i

      update(player, answer)
    elsif @data["row_#{row}".to_sym][column - 1].nil?
      @data["row_#{row}".to_sym][column - 1] = player
    end
    
   
  end

  def possible_wins(x)
    [[x,x+1,x+2,x+3],[x,x,x,x],[x,x-1,x-2,x-3]]
  end
  


  def check_vertical(main_row,i,vertical,player)
    sub_row = main_row - 1

    until sub_row < 1
      sub_arr = @data["row_#{sub_row}".to_sym]
      sub_arr.each_with_index {|po, index|
        if po == player && index == i && sub_row == vertical[-1] - 1
          vertical << sub_row
          break
        end
      }
      sub_row -= 1
    end
  end

  def check_horizonatal(player)
    temp = []
    @data.reverse_each.to_h.each_value {|arr|
     
      sub_arr = arr.map.with_index {|pos,i| pos == player ? i : ""}
      sub_arr.each_with_index {|pos,i|
        sub_temp = []
        sub_temp.push(pos, sub_arr[i + 1], sub_arr[i + 2], sub_arr[i + 3])
  
         temp << sub_temp.select {|i| i.is_a? Integer}
      }
    }
    temp = temp.select {|arr| arr.size == 4}
    
    temp.each {|arr|
      next unless possible_wins(arr[0]).include? arr 
      return possible_wins(arr[0]).include? arr 
    }
    false
  end

  def left_di(main_row,left_diagonal,player)
    sub_row = main_row - 1

    until sub_row < 1
      sub_arr = @data["row_#{sub_row}".to_sym]
      sub_arr.each_with_index {|po, index|
        if po == player && index < left_diagonal[-1]
          left_diagonal << index
          break
        end
      }
      sub_row -= 1
    end
  end

  def right_di(main_row,right_diagonal,player)
    sub_row = main_row - 1

    until sub_row < 1 
      sub_arr = @data["row_#{sub_row}".to_sym]
      sub_arr.each_with_index {|po, index|
        if po == player && index > right_diagonal[-1]
          right_diagonal << index
          break
        end
      }
      sub_row -= 1
    end

  end

  def check_diagonal_and_vertical(player)
    temp = []
    main_row = 6
    
    until main_row < 1
      main_arr = @data["row_#{main_row}".to_sym]
        main_arr.each_with_index {|pos, i|
          next unless pos == player
          right_diagonal = [i] 
          left_diagonal = [i] 
          vertical = [main_row]
         
          check_vertical(main_row,i,vertical,player)
          left_di(main_row,left_diagonal,player)
          right_di(main_row,right_diagonal,player)

          temp << vertical if vertical.size == 4
          temp << left_diagonal if left_diagonal.size == 4
          temp << right_diagonal if right_diagonal.size == 4
        }
      main_row -= 1
    end
    
    temp.each {|arr|
      next unless possible_wins(arr[0]).include? arr 
      return possible_wins(arr[0]).include? arr 
    }
    false
  end

  def check_winner(player)

    is_winner = false
    is_winner = check_horizonatal(player) unless is_winner
    is_winner = check_diagonal_and_vertical(player) unless is_winner
    is_winner
  end
end 
