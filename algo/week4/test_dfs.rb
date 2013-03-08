require 'dfs'

g = Graph.new
g.add_edge(:a,:b)
g.add_edge(:b,:c)
g.add_edge(:b,:d)
g.add_edge(:d,:c)
g.add_edge(:c,:a)
g.add_edge(:c,:e)
g.add_edge(:d,:f)
g.add_edge(:a,:h)

dfs(g, g.get_node(:a))

