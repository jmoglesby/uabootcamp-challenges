class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end
end
