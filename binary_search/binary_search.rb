class Node 
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value)
    @value = value
    @parent = nil
    @left_child = nil
    @right_child = nil
  end

end

class BinaryTree
  attr_accessor :root
  def initialize
    @root
  end

  def build_tree(arr)
    @root = Node.new(arr.shift)
    arr.each {|elem| add_node(elem, @root)}
  end

  def add_node(value, node)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left_child = add_node(value, node.left_child)
      node.left_child.parent = node
    elsif value >= node.value
      node.right_child = add_node(value, node.right_child)
      node.right_child.parent = node
    end
  end

  def breadth_first_search (value)
    queue_arr = [@root]
    
    until queue_arr.empty? 
      current = queue_arr.shift
        return current if value == current.value
      queue_arr.push(current.left_child) unless current.left_child.nil?
      queue_arr.push(current.right_child) unless current.right_child.nil?
    end

    nil
  end

  def depth_first_search(value)
  #preorder
    stack_arr = [@root]

    until stack_arr.empty?
      current = stack_arr.pop
      return current if current.value == value
      stack_arr.push(current.right_child) unless current.right_child.nil?      
      stack_arr.push(current.left_child) unless current.left_child.nil?     
    end
    nil 
  end

  def dfs_rec(value, node = @root) 
    return node if node.nil? || node.value == value
    
    current = dfs_rec(value, node.left_child)
    current = dfs_rec(value, node.right_child) if current.nil?
    current
  end

  def root
    @root
  end

#visual test for build_tree [7,4,23,8,9,3,5,7,67,6345,324]) only
  def display_tree
    puts "               #{@root.value}"
    puts "            /     \\"
    puts "           /       \\"
    puts "          #{@root.left_child.value}        #{@root.right_child.value}"
    puts "        /   \\     /   \\ "
    puts "       #{@root.left_child.left_child.value}     #{@root.left_child.right_child.value}   #{@root.right_child.left_child.value}     #{@root.right_child.right_child.value}"
    puts "                / \\     \\"
    puts "               #{@root.right_child.left_child.left_child.value}   #{@root.right_child.left_child.right_child.value}    #{@root.right_child.right_child.right_child.value}"
    puts "                        /"
    puts "                      #{@root.right_child.right_child.right_child.left_child.value}"
    puts "                      / \\"
    puts "                     #{@root.right_child.right_child.right_child.left_child.left_child.value} #{@root.right_child.right_child.right_child.left_child.left_child.value}"
   
  end


end


#test 

b_tree = BinaryTree.new
b_tree.build_tree([7,4,23,8,9,3,5,7,67,6345,324])
b_tree.display_tree
# b_tree.breadth_first_search(324)
# b_tree.depth_first_search(88)
# b_tree.dfs_rec(324)

