# recursive method
def sort(input)
	# one element? return input
	return input if input.size == 1
	# two elements? return sorted [not really needed]
	if input.size == 2
		if input[0] > input[1]
			return [input[1],input[0]]
		else
			return input
		end
	end
	# more elements? recursive call and merge them
	return merge(sort(input[0...input.size/2]), sort(input[input.size/2...input.size]))
end

# iteratively stitch the two inputs
def merge(a, b)
	c = []
	i = 0
	j = 0
	loop do
		# if b has ended or (a has not ended and value is lower), use value from a
		if j == b.size or (i < a.size and a[i] < b[j])
			c << a[i]
			i += 1
		else # b has not ended and (either a has ender or value is bigger)
			c << b[j]
			j += 1
		end
		break if i == a.size and j == b.size
	end
	return c
end
