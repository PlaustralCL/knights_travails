# frozen_string_literal: true

require "pry"
require "set"
require_relative "chess_helper"
require_relative "board"
require_relative "graph"
require_relative "square"

# Determines a knight's shortet path from the start square to the target
# square
class Knight
  include ChessNotation

  attr_accessor :start, :target, :unvisited
  attr_reader :gameboard

  def initialize(start = [0, 0], target = [3, 3])
    @gameboard = Board.new
    Graph.new(gameboard).build_graph
    @start = board[start.first][start.last]
    @target = board[target.first][target.last]
    @unvisited = create_unvisited
  end

  def create_unvisited
    unvisited_list = Set.new
    gameboard.each_square { |square| unvisited_list << square }
    unvisited_list
  end

  def board
    gameboard.board
  end

  # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
  def shortest_path
    start.distance = 0
    queue = []

    # binding.pry
    current_node = start
    until target.visited
      # puts "Current node is #{current_node.name}"
      current_node.adjacent.each { |square| queue << square }
      until queue.empty?
        working_node = queue.first
        if current_node.distance + 1 < working_node.distance
          working_node.distance = current_node.distance + 1
          working_node.path << current_node.name
        end
        queue.shift
      end
      current_node.visited = true
      @unvisted = unvisited.delete(current_node)
      current_node = find_next_node
    end



  end

  def find_next_node
    unvisited.to_a.reduce do |memo, square|
      memo.distance < square.distance ? memo : square
    end
  end



end

# graph = Graph.new
# knight = Knight.new
# graph.board[knight.start.first][knight.start.last].distance = 0
# graph.board.flatten.each do |square|
#   puts "#{square.name}, distance = #{square.distance}"
# end

knight = Knight.new
p knight.start.name
p knight.target.name
knight.shortest_path
p knight.target.distance
p knight.target.path
