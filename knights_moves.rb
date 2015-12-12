def knight_moves(origin, target)
  raise ArgumentError, 'Invalid squares' unless valid?(origin) && valid?(target)
  return [] if origin == target
  queue = [origin]
  visited = [origin]
  previous_square = {}
  until queue.empty?
    current_square = queue.shift
    possible_moves(current_square).each do |move|
      unless visited.include?(move)
        previous_square[move] = current_square
        return generate_path(move, previous_square) if move == target
        queue << move
        visited << move
      end
    end
  end
end

def valid?(move)
  move.all? { |coordinate| coordinate.between?(1,8) }
end

def possible_moves(origin)
  results = []
  results << [origin[0] + 1, origin[1] + 2]
  results << [origin[0] + 2, origin[1] + 1]
  results << [origin[0] + 2, origin[1] - 1]
  results << [origin[0] + 1, origin[1] - 2]
  results << [origin[0] - 1, origin[1] - 2]
  results << [origin[0] - 2, origin[1] - 1]
  results << [origin[0] - 2, origin[1] + 1]
  results << [origin[0] - 1, origin[1] + 2]
  results.select { |result| valid?(result) }
end

def generate_path(target, previous_square)
  moves = [target]
  while previous_square[target]
    target = previous_square[target]
    moves << target
  end
  moves.reverse
end