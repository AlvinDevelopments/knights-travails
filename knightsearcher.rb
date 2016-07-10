require_relative 'movetree'
require_relative 'queue'
require 'Time'
class KnightSearcher

  def initialize(tree)
    @tree = tree
    @path = []
    @node_queue = Queue.new
    @found = false
  end

  def bfs_for(target_coords)
    @node_queue.enqueue(@tree.start_move)
    check_node(@node_queue.dequeue, target_coords)

    if @path.size > 0
      puts "Moves: #{@path.size-1}"
      @path.each do |node|
        puts "[#{node[0]}, #{node[1]}]"
      end
    else
      puts "could not traverse to specific spot and specified level of depth"
    end
    @found = false
    @path = []
  end

  def dfs_for(target_coords)
    @tree.start_move.children.each do |node|
      check_node_dfs(node, target_coords)
      break if @found
    end

    if @path.size > 0
      puts "Moves: #{@path.size-1}"
      @path.each do |node|
        puts "[#{node[0]}, #{node[1]}]"
      end
    else
      puts "could not traverse to specific spot and specified level of depth"
    end
    @found = false
    @path = []
  end

  def check_node_dfs(move, target_coords)
    if move.x != target_coords[0] || move.y != target_coords[1]
      move.children.each do |node|
        check_node_dfs(node, target_coords)
        return if @found
      end
    else
      @found = true
      build_path(move)
      return
    end
  end

  def check_node(move, target_coords)
  # puts "checking [#{move.x}][#{move.y}] at depth: #{move.depth}"
    if move.x != target_coords[0] || move.y != target_coords[1]
      move.children.each do |child|
        @node_queue.enqueue(child)
      end
      while !@node_queue.empty?
        check_node(@node_queue.dequeue, target_coords)
      end
    else
      build_path(move)
      @node_queue = Queue.new
      return
    end
  end

  def build_path(node)
    if(node == @tree.start_move)
      @path << [node.x,node.y]
      @path = @path.reverse
      return
    end
    @path << [node.x,node.y]
    build_path(node.parent)
  end


end


tree = MoveTree.new([3,3], 3)
searcher = KnightSearcher.new(tree)
puts "USING BFS"
before = Time.now
searcher.bfs_for([0,1])
after = Time.now
puts "BFS took #{after-before}"
puts "USING DFS"
before = Time.now
searcher.dfs_for([0,1])
after = Time.now
puts "DFS took #{after-before}"
