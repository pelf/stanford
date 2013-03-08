require 'graph'

# reads graph from txt file
def readfile(file="kargerAdj.txt")
	g = Graph.new
	File.open(file, "r") do |infile|
		while (line = infile.gets)
			verts = line.split
			v1 = verts.delete_at(0)
			verts.each do |v2|
				g.add_edge(v1,v2)
			end
		end
	end
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


min = 10000
100000.times do
	mincut = rmincut(readfile)
	min = mincut if mincut < min
end

puts min