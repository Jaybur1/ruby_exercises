class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  
 #adds new node to the end of the list 
  def append(value)
    node = Node.new
    node.value = value
    @head ? @tail.next_node = node : @head = node
    @tail = node
    @size += 1
    node.index = @size - 1 
  end

 #adds new node to the begining of the list
  def prepend(value)
    node = Node.new
    node.value = value
    if @head
      node.next_node = @head
      @head = node
    else
      @head = node
    end
    @size += 1
    update_index
  end

 #returns the total number of nodes in the list
  def size
    @size
  end
 
 #returns the head of the list
  def head
    @head
  end
 
 #returns the tail of the list
  def tail
    @tail
  end

 #returns the node at the given index
  def at(index)
    node = @head
    until node.index == index
      node = node.next_node
    end
    node
  end

 #removes the last element of the list
  def pop
    node = at(@size - 2)
    node.next_node = nil
    @size -= 1
  end

 #returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    node = @head
    @size.times {
      return true if node.value == value
      node = node.next_node
    }
    false
  end
 
 #returns the index of the node containing data, or nil if not found.
  def find(data)
    node = @head
    @size.times {
      return node.index if node.value == data
      node = node.next_node
    }
    nil
  end

 #represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
  def to_s
   node = @head
   output = ""
 
   @size.times {
     output << "( #{node.value} ) ~> "  #in case you want to display the index aswell #{, index: #{node.index}}
     node = node.next_node
   }
   output + "nil"
  end
 
  def update_index
      node = @head
      i = 0
      while i < @size
        node.index = i
        node = node.next_node
        i += 1
      end
  end

 #EXTRA CREDIT
 #inserts/overrides the node at the given index
  def insert_at(index, value)
    return nil if index < 0 || index > @size - 1

    case index 
    when 0 then prepend(value)
    when @size - 1 then append(value)

    else
    node = at(index - 1)
    new_node = Node.new
    new_node.value = value
    new_node.next_node = node.next_node
    node.next_node = new_node
    @size += 1
    update_index
    end
  end

 #removes the node at the given index.
  def remove_at(index)
    return nil if index < 0 || index > @size
    case index
    when 6 then pop
    when 0 
      node = at(index)
      @head = node.next_node
      @size -= 1
      update_index
    else
      before = at(index - 1)
      after = at(index + 1)

      before.next_node = after
      @size -= 1
      update_index
    end
  end
 
end

class Node
  attr_accessor :value, :next_node, :index

  def initialize
    @value = nil
    @next_node = nil
    @index = nil
  end

end

#### test ####
list = LinkedList.new

list.append("I'm a node")
list.append('me too')
list.prepend("me like")
list.append('polka')
list.prepend('Hello')
list.insert_at(4,'po')
list.insert_at(0,'test')
list.remove_at(3)
p list.to_s