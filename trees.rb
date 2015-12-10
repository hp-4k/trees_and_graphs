class Node
  
  attr_accessor :value, :parent, :left_child, :right_child
  
  def initialize(options)
    @value = options[:value]
    @parent = options[:parent]
    @left_child = options[:left_child]
    @right_child = options[:right_child]
  end  
end

def add_to_tree(top_node, value)
  if value <= top_node.value
    if top_node.left_child.nil?
      top_node.left_child = Node.new(value: value, parent: top_node)
    else
      add_to_tree(top_node.left_child, value)
    end
  else
    if top_node.right_child.nil?
      top_node.right_child = Node.new(value: value, parent: top_node)
    else
      add_to_tree(top_node.right_child, value)
    end
  end
end

def build_tree(array)
  top_node = nil
  array.each do |value|
    if top_node.nil?
      top_node = Node.new(value: value)
    else
      add_to_tree(top_node, value)
    end
  end
  top_node
end