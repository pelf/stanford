require 'dfs'

# reads graph from txt file
def readfile(file="SCC.txt")
	g = Graph.new
	File.open(file, "r") do |infile|
		while (line = infile.gets)
			verts = line.split
			g.add_edge(verts[0], verts[1])
		end
	end
	return g
end
puts 'reading file'
g = readfile
puts 'starting scc'
scc(g)
