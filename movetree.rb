class MoveTree

  Move = Struct.new(:x, :y, :depth, :children, :parent)

  attr_reader :start_move, :max_x, :max_y, :max_depth

  def initialize(coordinates, max_depth)
    @max_x = 4
    @max_y = 4
    @max_depth = max_depth
    @current_depth = 0
    @move_count = 0
    @start_move = Move.new(coordinates[0], coordinates[1], @current_depth, [], nil)
    @move_count +=1
    #  puts "adding [#{@start_move.x}][#{@start_move.y}]"
     add_move(@start_move) if @current_depth < @max_depth
  end


  def add_move(move)
    @current_depth+=1
    if in_bounds?(move.x+2, move.y+1) && @current_depth<= @max_depth
       @move_count+=1
       new_child = Move.new(move.x+2, move.y+1, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
    if in_bounds?(move.x+2, move.y-1) && @current_depth<= @max_depth
       @move_count+=1
       new_child = Move.new(move.x+2, move.y-1, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
    if in_bounds?(move.x-2, move.y+1) && @current_depth <= @max_depth
       @move_count+=1
       new_child = Move.new(move.x-2, move.y+1, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
    if in_bounds?(move.x-2, move.y-1) && @current_depth<= @max_depth
       @move_count+=1
       new_child = Move.new(move.x-2, move.y-1, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
    if in_bounds?(move.x+1, move.y+2) && @current_depth<= @max_depth
       @move_count+=1
       new_child = Move.new(move.x+1, move.y+2, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
    if in_bounds?(move.x+1, move.y-2) && @current_depth<= @max_depth
       @move_count+=1
       new_child = Move.new(move.x+1, move.y-2, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
    if in_bounds?(move.x-1, move.y+2) && @current_depth <= @max_depth
       @move_count+=1
       new_child = Move.new(move.x-1, move.y+2, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
    if in_bounds?(move.x-1, move.y-2) && @current_depth <= @max_depth
       @move_count+=1
       new_child = Move.new(move.x-1, move.y-2, @current_depth, [], move)
       move.children << new_child
                  add_move(new_child)
    end
   @current_depth-=1
  end

  def in_bounds?(x,y)
    return false if x > @max_x || y > @max_y || x < 0 || y < 0
    return true
  end


  def inspect
    puts "Your tree has #{@move_count} Move nodes and a maximum depth of #{@max_depth}."
  end

end
