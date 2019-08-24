class LinkedListNode
  attr_accessor :value, :next_node

  def initialize value, next_node=nil
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def intialize
    @data = nil
  end

  def push value
    if @data == nil
      @data = LinkedListNode.new(value)
    else
      new_data = LinkedListNode.new(value, @data)
      @data = new_data
    end
  end

  def pop
    if @data
      top_value = @data.value
      @data = @data.next_node
      return top_value
    else
      return nil
    end
  end
end

def print_values list_node
  if list_node
    print "#{list_node.value} --> "
    print_values list_node.next_node
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  reversed_list = Stack.new

  while list
    reversed_list.push(list.value)
    list = list.next_node
  end

  return reversed_list.data
end

# EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>

stack = Stack.new

stack.push 2
stack.push 4
stack.push 6
stack.push 8

print_values(stack.data)

puts "---------------------------"

revlist = reverse_list(stack.data)

print_values(revlist)