module TreeTraversal
  def self.depth_first(payload, origin)
    traversal_hash = { payload: payload, node: origin, path: [], checked: [] }
    dive(traversal_hash)
  end

  def self.dive(hash)
    res = 'Payload not found.'

    unless hash[:node].nil?
      if hash[:payload] == hash[:node].payload
        res = hash[:node]

      elsif hash[:node].children.count.zero? || all_children_checked(hash)
        # climb tree
        hash[:checked] << hash[:node]
        if hash[:path].count.zero?
          return res
        else
          hash[:node] = hash[:path].pop
          res = dive(hash)
        end

      else
        hash[:checked] << hash[:node]
        hash[:path] << hash[:node]
        i = 0
        while i < hash[:node].children.count do
          if hash[:checked].include?(hash[:node].children[i])
            i += 1
          else
            hash[:node] = hash[:node].children[i]
            res = dive(hash)
          end
        end
      end
    end

    return res
  end

  def self.breadth_first(payload, origin)
    traversal_hash = { payload: payload, checking: [origin], to_check: [] }
    shallow_dive(traversal_hash)
  end

  def self.shallow_dive(hash)
    res = 'Payload not found.'

    unless hash[:checking].count.zero?
      hash[:checking].each do |node|
        res = hash[:payload] == node.payload ? node : nil
      end

      unless res
        hash[:checking].each do |node|
          node.children.each do |child|
            hash[:to_check] << child
          end
        end
        hash[:checking] = hash[:to_check]
        hash[:to_check] = []

        res = shallow_dive(hash)
      end
    end

    return res
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
