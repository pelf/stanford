# recursive
def mult(x,y)
	# FIXME - assuming square matrices with length N even, and both matrices the same size
	return [x[0][0]*y[0][0]] if x.size == 1
	
	# build the 4 sub-matrices
	x_quadrants = [] # will hold the 4 quadrants
	y_quadrants = [] # will hold the 4 quadrants
	# iterate the 4 quadrants: 0,0  0,1  1,0  1,1
	for qi in 0..1
		for qj in 0..1
			# build the new sub-matrix for the current quadrant
			n_2 = x.size / 2 # sub-matrix side length
			# DANGEROUS. WE CANT DO THIS:
			# x1 = Array.new(n_2, Array.new(n_2)) # The initialization values of Array.new(n_2) will all point to the same object
			# y1 = Array.new(n_2, Array.new(n_2))
			x1 = Array.new(n_2) {|i| Array.new(n_2)}
			y1 = Array.new(n_2) {|i| Array.new(n_2)} 
			# fill it in
			for i in 0...n_2
				for j in 0...n_2
					x1[i][j] = x[qi*n_2 + i][qj*n_2 + j]
					y1[i][j] = y[qi*n_2 + i][qj*n_2 + j]
				end
			end
			x_quadrants << x1
			y_quadrants << y1
		end
	end
	
	# ae + bg, af + bh, ce + dg, cf + dh
	ae = mult(x_quadrants[0],y_quadrants[0])
	bg = mult(x_quadrants[1],y_quadrants[2])
	
	af = mult(x_quadrants[0],y_quadrants[1])
	bh = mult(x_quadrants[1],y_quadrants[3])
	
	ce = mult(x_quadrants[2],y_quadrants[0])
	dg = mult(x_quadrants[3],y_quadrants[2])
	
	cf = mult(x_quadrants[2],y_quadrants[1])
	dh = mult(x_quadrants[3],y_quadrants[3])
	
	for i in 0...x_quadrants.size
		mult(x_quadrants[i], y_quadrants[i])
	end
end