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

def infinite_list? head
  tortoise = head
  hare = head

  return t_and_h_race tortoise, hare
end

def t_and_h_race tortoise, hare
  
  tortoise = tortoise.next_node
  if hare.next_node
    hare = hare.next_node.next_node
  else
    hare = nil
  end

  if tortoise == nil || hare == nil
    return false
  elsif tortoise == hare
    return true
  else
    t_and_h_race tortoise, hare
  end

end

# EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>

node1 = LinkedListNode.new(2)
node2 = LinkedListNode.new(4, node1)
node3 = LinkedListNode.new(6, node2)
node4 = LinkedListNode.new(8, node3)

puts "\n**\nReverse Recursively:"
print_values(node4)
puts "---------------------------"
new_head = reverse_list(node4)
print_values(new_head)

inf_node1 = LinkedListNode.new(2)
inf_node2 = LinkedListNode.new(4, inf_node1)
inf_node3 = LinkedListNode.new(6, inf_node2)
inf_node4 = LinkedListNode.new(8, inf_node3)
inf_node1.next_node = inf_node3

puts "\n**\nDetect Infinite List:"
puts "inf_node4 is infinte? #{infinite_list?(inf_node4)}"
puts "--------------------------"
puts "node4 is infinite? #{infinite_list?(node4)}\n\n"