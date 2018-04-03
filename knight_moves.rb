class Board
	attr_accessor :coords
	def initialize
		$coords = Array.new
		for i in 0...8
			for j in 0...8
				$coords.push([i,j])
			end
		end
	end
end

class Knight
	attr_accessor :pos, :prev, :moves
	def initialize(pos=[0,3],prev=nil,moves=[])
		@pos = pos
		@moves = []
		@prev = prev
	end

end

def next_moves(knight)
	nxt = knight.pos
	moves = [[1,-2],[1,2],[-1,-2],[-1,2],[-2,-1],[-2,1],[2,-1],[2,1]]
	moves.each do |x|
		nxt_spot = [(x[0] + nxt[0]),(x[1] + nxt[1])]
		if (nxt_spot[0] >= 0 && nxt_spot[0] < 8) && (nxt_spot[1] >= 0 && nxt_spot[1] < 8)
			new_knight = Knight.new(nxt_spot,knight)
			knight.moves.push(new_knight)
		end
	end
end

def knight_moves(start, dst)
	return nil if !(dst[0] >= 0 && dst[0] < 8) && (dst[1] >= 0 && dst[1] < 8)
	knight = Knight.new(start)
	moves = []
	while 1
		next_moves(knight)
		break if knight.pos == dst
		moves += knight.moves
		break if moves.length < 1
		knight = moves.shift
	end
	return nil if knight.pos != dst
	path = [knight.pos]
	while (!knight.prev.nil?)
		path << knight.prev.pos
		knight = knight.prev
	end
	path.reverse!
end


p knight_moves([0,0], [1,2])
p knight_moves([0,0], [3,3])
p knight_moves([3,3], [0,0])
p knight_moves([1,1], [6,7])