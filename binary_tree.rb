class BinaryTree
	class Node
		attr_accessor :value, :left, :right
		def initialize(value)
			@value = value
			@root = nil
		end
		def insert(input)
			if input <= @value
				@left.nil? ? @left = Node.new(input) : @left.insert(input)
			elsif input > @value
				@right.nil? ? @right = Node.new(input) : @right.insert(input)
			end unless input == nil
		end
	end

	def initialize
		@root = nil
	end

	def insert(value)
		if @root == nil
			@root = Node.new(value)
		else
			@root.insert(value)
		end
	end
	
	def search(input, node=@root)
		return nil if node.nil?
		if input < node.value
			search(input, node.left)
		elsif input > node.value
			search(input, node.right)
		else
			return node
		end
	end
end
def build_tree(arr)
	$tree = BinaryTree.new
	arr.each {|el| $tree.insert(el)}
end

crazy_arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
build_tree(crazy_arr)
puts $tree.search(7).value

