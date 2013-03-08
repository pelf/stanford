require 'dfs'

g = Graph.new
g.add_edge(:s,:v)
g.add_edge(:v,:t)
g.add_edge(:s,:w)
g.add_edge(:w,:t)
g.add_edge(:s,:x)
g.add_edge(:s,:y)
g.add_edge(:x,:y)

top_sort(g)
