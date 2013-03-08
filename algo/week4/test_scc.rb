require 'dfs'

g = Graph.new
g.add_edge(:a,:b)
g.add_edge(:b,:c)
g.add_edge(:c,:a)
g.add_edge(:b,:d)
g.add_edge(:d,:e)
g.add_edge(:d,:g)
g.add_edge(:g,:e)
g.add_edge(:e,:f)
g.add_edge(:f,:g)
g.add_edge(:c,:h)
g.add_edge(:c,:k)
g.add_edge(:k,:h)
g.add_edge(:h,:g)
g.add_edge(:h,:j)
g.add_edge(:h,:i)
g.add_edge(:i,:j)
g.add_edge(:i,:f)
g.add_edge(:j,:k)
g.add_edge(:a,:a)

scc(g)
