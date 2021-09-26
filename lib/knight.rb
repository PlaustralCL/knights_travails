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

  attr_reader :gameboard, :start, :target, :unvisited

  def initialize
    @gameboard = Board.new
    Graph.new(gameboard).build_graph
    select_start_square
    select_target_square
    @unvisited = create_unvisited
  end

  def select_start_square
    puts "Start square:"
    start_grid = name_to_grid(choose_square)
    @start = board[start_grid.first][start_grid.last]
  end

  def select_target_square
    puts "Target square:"
    target_grid = name_to_grid(choose_square)
    @target = board[target_grid.first][target_grid.last]
  end

  def create_unvisited
    unvisited_list = Set.new
    gameboard.each_square { |square| unvisited_list << square }
    unvisited_list
  end

  def board
    gameboard.board
  end

  def shortest_path
    start.distance = 0
    queue = []

    current_node = start
    until target.visited
      current_node.adjacent.each { |square| queue << square }
      process_queue(queue, current_node) until queue.empty?
      current_node.visited = true
      @unvisted = unvisited.delete(current_node)
      current_node = find_next_node
    end
  end

  def process_queue(queue, current_node)
    working_node = queue.first
    update_working_node(working_node, current_node) if current_node.distance + 1 < working_node.distance
    queue.shift
  end

  def update_working_node(working_node, current_node)
    working_node.distance = current_node.distance + 1
    working_node.path = current_node.path + [working_node.name]
  end

  def find_next_node
    unvisited.to_a.reduce do |memo, square|
      memo.distance < square.distance ? memo : square
    end
  end

  def show_result
    puts "You made it from #{start.name} to #{target.name} in #{target.path.size - 1} moves!"
    puts "Here is the path: #{target.path.join( ' --> ')}"
  end
end

knight = Knight.new
knight.shortest_path
knight.show_result
