# reads integer array from txt file
def readfile(file="IntegerArray.txt")
	array = []
	File.open(file, "r") do |infile|
		while (line = infile.gets)
			array << line.strip.to_i
		end
	end
	return array
end

def count(input)
	a, i = rcount(input)
	return i
end

# recursive method
def rcount(input)
	# one element? return input
	return input, 0 if input.size == 1
	# two elements? return sorted [not really needed]
	if input.size == 2
		if input[0] > input[1]
			return [input[1],input[0]], 1
		else
			return input, 0
		end
	end
	# more elements? recursive call and count/merge them
	a, sa = rcount(input[0...input.size/2]) # left inversions
	b, sb = rcount(input[input.size/2...input.size]) # right inversions
	c, sc = merge(a,b) # split inversions
	return c, sa+sb+sc # sum left, right and split inversions
end

# iteratively stitch the two inputs and count the split inversions
def merge(a, b)
	c = []
	i = 0
	j = 0
	splits = 0
	loop do
		# if b has ended or (a has not ended and value is lower), use value from a
		if j == b.size or (i < a.size and a[i] < b[j])
			c << a[i]
			i += 1
		else # b has not ended and (either a has ender or value is bigger)
			c << b[j]
			j += 1
			# nr of split inverions = remaining elements in a
			# because b[j] just moved in front of them
			splits += (a.size-i) 
		end
		break if i == a.size and j == b.size
	end
	return c, splits
end
