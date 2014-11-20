def djkstra(graph, source)
  dist[source] = 0
  graph.each do |v|
    unless v == source
      dist[v] = Float::Infinity
      previous[v] = nil
    end
    q.push v
  end

  while q.size > 0
    u = q.index dist[1..-1].min
    q.delete u

    graph[u].each do |v|
      if q[v]
        alt = dist[u] + v.dist(u)
        if alt < dist[v]
          dist[v] = alt
          previous[v] = u
        end
      end
    end
  end
  pp dist
  pp previous
end