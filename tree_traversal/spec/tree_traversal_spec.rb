require 'spec_helper'

RSpec.describe TreeTraversal do
  class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
      @payload = payload
      @children = children
    end
  end

  describe '-- depth_first()' do
    it 'should return the deepest match' do
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

      expect(TreeTraversal.depth_first(5, trunk)).to eq deep_fifth_node
    end

    it 'should return "Payload not found." if no match exists' do
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

      expect(TreeTraversal.depth_first(1, trunk)).to eq 'Payload not found.'
    end
  end

  describe '-- breadth_first()' do
    it 'should return the shallowest match' do
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

      expect(TreeTraversal.breadth_first(5, trunk)).to eq shallow_fifth_node
    end

    it 'should return "Payload not found." if no match exists' do
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

      expect(TreeTraversal.breadth_first(1, trunk)).to eq 'Payload not found.'
    end
  end
end
