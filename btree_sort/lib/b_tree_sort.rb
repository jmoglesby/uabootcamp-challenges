require 'binary_tree'

module BTreeSort

  def self.sort(array)
    res = []
    btree_trunk = BinaryTree.new(array.slice!(0))
    btree_nodes = [btree_trunk]

    array.each do |item|
      btree_nodes << add_to_btree(item, btree_trunk)
    end

    unpack_hash = { node: btree_trunk, res: res, path: [], pushed: [] }
    unpack_btree(unpack_hash)

    return res
  end

  def self.add_to_btree(item, node)
    res = nil

    # compare item to payloads in depth-first manner
    if item > node.payload
      if node.right
        res = add_to_btree(item, node.right)
      else
        res = BinaryTree.new(item)
        node.right = res
      end
    else
      if node.left
        res = add_to_btree(item, node.left)
      else
        res = BinaryTree.new(item)
        node.left = res
      end
    end

    return res
  end

  def self.unpack_btree(hash)
    unless hash[:node].nil?
      if hash[:node].right.nil? && hash[:node].left.nil?
        hash[:res] << hash[:node].payload
        hash[:pushed] << hash[:node]
        hash[:node] = hash[:path].pop
        return unpack_btree(hash)
      end

      if hash[:node].left # node has left
        if hash[:pushed].include?(hash[:node].left) # node has pushed-left
          if hash[:node].right # node has pushed-left / right
            if hash[:pushed].include?(hash[:node].right) # node has pushed-left / pushed-right
              hash[:node] = hash[:path].pop
              return unpack_btree(hash)

            else # node has pushed-left / unpushed-right
              hash[:res] << hash[:node].payload
              hash[:pushed] << hash[:node]
              hash[:node] = hash[:node].right
              return unpack_btree(hash)

            end
          else # node has pushed-left / no-right
            hash[:res] << hash[:node].payload
            hash[:pushed] << hash[:node]
            hash[:node] = hash[:path].pop
            return unpack_btree(hash)

          end

        else # node has unpushed-left
          hash[:path] << hash[:node]
          hash[:node] = hash[:node].left
          return unpack_btree(hash)

        end

      elsif hash[:node].right # node has no-left / right
        if hash[:pushed].include?(hash[:node].right) # node has no-left / pushed-right
          hash[:node] = hash[:path].pop
          return unpack_btree(hash)

        else # node has no-left / unpushed-right
          hash[:res] << hash[:node].payload
          hash[:pushed] << hash[:node]
          hash[:node] = hash[:node].right
          return unpack_btree(hash)

        end
      end
    end
  end
end
