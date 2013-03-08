# reads graph from txt file
def readfile(file="HashInt.txt")
	a = []
	File.open(file, "r") do |infile|
		while (line = infile.gets)
			a << line.strip.to_i
		end
	end
	return a
end

# naive approach, for the fun: O(n^2)
def naive(a, target)
	a.each do |ie, i|
		a.each do |je, j|
			next if i == j # cant be the same, i assume
			return true if ie + je == target
		end
	end
	return false
end

# hashtable approach
def hashtable(a, target)
	# place them in a hashtable
	h = {}
	a.each do |i|
		h[i] = true
	end
	# run through the array
	a.each do |i|
		# how much do we need to get the target?
		dif = target - i
		return true if h[dif]
	end
	return false
end

a = readfile

targets = [231552,234756,596873,648219,726312,981237,988331,1277361,1283379]

targets.each do |t|
	puts hashtable(a, t)
end