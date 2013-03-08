class Graph
	attr_accessor :edges, :vertices, :n, :m
	
	def initialize()
		self.edges = {}
		self.vertices = {}
		self.n = 0
		self.m = 0
	end
	
	def add_vertex(v)
		unless self.vertices[v]
			self.vertices[v] = []
			self.n += 1
			return true
		end
		return false
	end
	
	def add_edge(v1,v2)
		add_vertex(v1)
		add_vertex(v2)
		# TODO: check if v1 and v2 are already connected
		self.edges[self.m] = [v1, v2]
		self.vertices[v1] << self.m
		self.vertices[v2] << self.m
		self.m += 1
		return true
	end
	
	def merge_vertices(v1, v2)
		# puts "merging #{v1} and #{v2}: keeping #{v1}"
		# keep v1, remove v2
		
		# move v2 edges to v1
		self.vertices[v2].each do |e|
			edge = self.edges[e]
			# future self loop? avoid it
			if edge[0] == v1 or edge[1] == v1
				self.m = self.m - 1
				self.edges.delete e
				self.vertices[v1].delete e # dangerous!? yes or no? (because we're looping it)
				next
			end
			# change v2 in the edge to v1
			if edge[0] == v2
				edge[0] = v1
				
			else
				edge[1] = v1
				
			end
			# move edge to v1
			self.vertices[v1] << e
		end
		# delete v2
		self.vertices.delete v2
		self.n = self.n - 1
		
		return true
	end
end