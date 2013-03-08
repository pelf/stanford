class Node
	attr_accessor :label, :edges, :visited, :top_order, :leader, :scc, :reversed_edges
	
	def initialize(label)
		self.label = label
		self.edges = []
		self.reversed_edges = []
		self.visited = false
	end
	
	def add_edge(n)
		self.edges << n
		n.reversed_edges << self
	end
	
	def to_s
		label.to_s
	end
end

class Graph
	attr_accessor :nodes
	
	def initialize
		self.nodes = {}
	end
	
	def add_node(n)
		self.nodes[n] = Node.new(n)
	end
	
	def add_edge(a,b)
		a = get_node(a) || add_node(a)
		b = get_node(b) || add_node(b)
		a.add_edge(b)
	end
	
	def get_node(n)
		self.nodes[n]
	end
end