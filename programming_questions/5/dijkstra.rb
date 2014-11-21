require 'pp'
require 'byebug'

graph = {}
File.readlines('dijkstraData.txt').each do |line|
  data = line.chomp.split("\t")
  graph[data[0].to_i] = data[1..-1].map{|v| v.split(',').map(&:to_i)}
end

def djkstra(graph, source_index)
  dist = []
  previous = []
  q = []
  dist[source_index] = 0
  graph.each do |v|
    v_index = v.first
    unless v_index == source_index
      dist[v_index] = 1000000
      previous[v_index] = nil
    end
    q.push v_index
  end

  while q.size > 0
    # ugly implementation of
    # "u := vertex in Q with min dist[u]  // Source node in first case"
    # without heap
    u_index = Hash[dist.each_with_index.select{|d, i| q.index(i)}].sort.first.last
    q.delete u_index

    graph[u_index].each do |v|
      v_index, u_v_dist = v.first, v.last
      if q.index v_index
        alt = dist[u_index] + u_v_dist
        if alt < dist[v_index]
          dist[v_index] = alt
          previous[v_index] = u_index
        end
      end
    end
  end
  [dist, previous]
end

v_needed = [7,37,59,82,99,115,133,165,188,197]

dist, previous =  djkstra graph, 1

result = dist.each_with_index.select{|d, i| v_needed.index(i)}

pp dist
pp v_needed
puts result
