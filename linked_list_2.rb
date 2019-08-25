class LinkedListNode
  attr_accessor :value, :next_node

  def initialize value, next_node=nil
    @value = value
    @next_node = next_node
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

def reverse_list head, previous=nil
  new_head = head.next_node
  head.next_node = previous
  if new_head
    reverse_list new_head, head
  else
    return head
  end
end

# EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>

node1 = LinkedListNode.new(2, nil)
node2 = LinkedListNode.new(4, node1)
node3 = LinkedListNode.new(6, node2)
node4 = LinkedListNode.new(8, node3)

print_values(node4)

puts "---------------------------"

new_head = reverse_list(node4)

print_values(new_head)