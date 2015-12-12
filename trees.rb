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

def print_tree(from_node)
  print_tree(from_node.left_child) if from_node.left_child
  print "#{from_node.value} "
  print_tree(from_node.right_child) if from_node.right_child
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

def breadth_first_search(start_node, target_value)
  queue = []
  visited = []
  queue.push(start_node)
  visited.push(start_node)
  until queue.empty?
    current_node = queue.shift
    [current_node.left_child, current_node.right_child].each do |child|
      if child && !visited.include?(child)
        if child.value == target_value
          puts "Inspected #{visited.size} nodes"
          return child
        end
        visited.push(child)
        queue.push(child)
      end
    end
  end
  nil
end

def depth_first_search(start_node, target_value)
  stack = []
  visited = []
  stack.push(start_node)
  visited.push(start_node)
  until stack.empty?
    current_node = stack.pop
    [current_node.left_child, current_node.right_child].each do |child|
      if child && !visited.include?(child)
        if child.value == target_value
          puts "Inspected #{visited.size} nodes"
          return child
        end
        visited.push(child)
        stack.push(child)
      end
    end
  end
  nil
end