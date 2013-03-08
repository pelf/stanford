require 'models'

# basic dfs
def dfs(g, n)
	puts n
	n.visited = true
	n.edges.each do |e|
		dfs(g, e) unless e.visited
	end
end

# modified for topological ordering
def dfs2(g, n)
	n.visited = true
	n.edges.each do |e|
		dfs2(g, e) unless e.visited
	end
	n.top_order = @@current
	puts "#{n} #{@@current}"
	@@current -= 1
end

# topological sort
def top_sort(g)
	@@current = g.nodes.size
	g.nodes.each do |l,n|
		dfs2(g, n) unless n.visited
	end
end

# modified for scc
def dfs3(g, n, mode=1)
	n.visited = mode
	if mode == 2
		n.leader = @@s 
		# puts "#{n}: leader => #{@@s}"
		@@groups[@@s.to_s] ||= 0
		@@groups[@@s.to_s] += 1
		n.reversed_edges.each do |e|
			dfs3(g, e, mode) unless e.visited == mode
		end
	elsif mode == 1
		n.edges.each do |e|
			dfs3(g, e, mode) unless e.visited == mode
		end
		@@t += 1
		n.scc = @@t
		# puts "#{n}: #{@@t}"
	end
end

# strongly connected components
def scc(g)
	@@groups = {}
	# 1st pass
	@@t = 0
	g.nodes.to_a.each do |l,n|
		unless n.visited == 1
			dfs3(g, n) 
		end
	end
	# 2nd pass
	@@s = nil
	g.nodes.to_a.sort{|a,b| b[1].scc <=> a[1].scc}.each do |l,n|
		unless n.visited == 2
			@@s = n
			dfs3(g, n, 2) 
		end
	end
	puts @@groups.to_a.sort{|a,b| b[1]<=>a[1]}.inspect
end