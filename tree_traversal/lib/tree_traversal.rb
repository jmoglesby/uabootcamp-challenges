module TreeTraversal
  def self.depth_first(payload, origin)
    traversal_hash = { payload: payload, node: origin, path: [], checked: [] }
    dive(traversal_hash)
  end

  def self.dive(hash)
    res = 'nothing'
    puts hash[:payload]
    puts hash[:node].payload
    if hash[:payload] == hash[:node].payload # this failed to return true at node 2>7>6>5
      puts "inside if: "
      res = hash[:node]
      puts "res equals: #{res.inspect}"
      return res

    elsif hash[:node].children.count.zero? || all_children_checked(hash)
      # climb tree
      puts "inside elsif: "
      hash[:checked] << hash[:node]
      hash[:node] = hash[:path].pop
      puts hash[:node].inspect
      dive(hash)

    else
      puts "inside else: "
      hash[:checked] << hash[:node]
      hash[:path] << hash[:node]
      i = 0
      while i < hash[:node].children.count do
        if hash[:checked].include?(hash[:node].children[i])
          i += 1
        else
          hash[:node] = hash[:node].children[i]
          dive(hash)
        end
      end
    end
    puts "now res equals: #{res.inspect}"
    # return res
  end


  def self.all_children_checked(hash)
    res = true
    hash[:node].children.each do |child|
      res = hash[:checked].include?(child)
      if res == false
        return res
      end
    end
    return res
  end
end

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])
