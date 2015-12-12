Binary trees and graph algorithms
=================================

These files contain solutions to exercises on basic data structures and algorithms forming a part of the Ruby path of [The Odin Project curriculum](http://www.theodinproject.com/ruby-programming).

#### trees.rb
- implements building and printing the contents of a binary tree
- implements breadth-first search algorithm to search through the contents of a graph (this example uses breadth first search to go through the contents of a binary tree, this is inefficient and is meant only as an exercise)
- implements depth-first search algorithm to search through the contents of a graph (again, binary tree is searched through only for demonstration purposes)


#### knights_moves.rb
Implements function `knight_moves(origin, target)` which takes two arrays `[x, y]` where both `x` and `y` are integers between 1 and 8 representing a square on a chess board. The function uses a breadth-first search algorithm to find the shortest path a knight (a chess piece) can take to move from the origin to the target square.

