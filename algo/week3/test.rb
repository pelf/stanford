require 'graph'


def newg
g = Graph.new

g.add_edge(:a,:b)
g.add_edge(:a,:d)
g.add_edge(:b,:c)
g.add_edge(:b,:d)
g.add_edge(:b,:e)
g.add_edge(:c,:e)
g.add_edge(:c,:d)
g.add_edge(:d,:e)

return g
end

def rmincut(g)
	# while we have more than 2 verts
	while g.n > 2 do
		# pick random edge
		edge = g.edges.to_a[g.m*rand][0]
		edge = g.edges[edge]
		# merge the 2 verts adjacent to this edge
		g.merge_vertices(edge[0],edge[1])
	end
	return g.m
end

min = 1000
100.times do 
	mincut = rmincut(newg)
	min = mincut if mincut < min
end

puts min