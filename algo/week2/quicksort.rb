# reads integer array from txt file
def readfile(file="QuickSort.txt")
	array = []
	File.open(file, "r") do |infile|
		while (line = infile.gets)
			array << line.strip.to_i
		end
	end
	return array
end

# this is my interpretation of quicksort 
# I dit it before seeing the complete explanation of the algorithm,
# so it's slightly diferent from the one that ended up being shown
# Partition routine:
#   MINE GOES: [pivot,smaller,unseen,bigger] - I either swap
#   THEIR GOES: [pivot,smaller,bigger,unseen]
def mypartition(array)
	# pick pivot randomly
	pivot_position = rand*array.size # used at the end to return the final position of the pivot
	pivot = array[pivot_position] 
	swap(array, pivot_position, 0) # move pivot to the first position
	current = 1 # position we're checking atm
	bigger = array.size - 1 # bigger elements moved
	# scan the array, keeping smaller values on the left and pushing bigger values to the end
	loop do
		# are we done?
		if current == bigger
			# swap pivot with the current number or the previous
			if pivot < array[current]
				swap(array, 0, current-1)
				pivot_position = current-1
			else
				swap(array, 0, current)
				pivot_position = current
			end
			break
		end
		# is current element bigger or smaller than the pivot?
		if pivot < array[current] # current is bigger
			# swap current with the last unseen
			swap(array,current,bigger)
			bigger -= 1 # decrease bigger
		else # current is smaller
			# move on
			current += 1
		end
		
	end
	return pivot_position, array
end

def partition(array, l, r)
	# pick pivot: median of three
	m = ((r-l) / 2) + l
	median = median([array[l],array[m],array[r]])
	if array[r] == median
		swap(array, l, r)
	elsif array[m] == median
		swap(array, m, l)
	end
	
	pivot = array[l]
	i = l + 1
	j = l + 1
	loop do 
		if array[j] < pivot
			swap(array,i,j)
			i += 1
		end
		break if j == r
		j += 1
	end
	swap(array,l,i-1)
	return i-1
end

def swap(array,i,j)
	temp = array[i]
	array[i] = array[j]
	array[j] = temp
end

def quicksort(array,l=0,r=array.size-1)
	return 0 if r-l <= 0
	pivot_position = partition(array,l,r)
	p1 = quicksort(array,l,pivot_position-1)
	p2 = quicksort(array,pivot_position+1,r)
	return ((r-l)+p1+p2)
end

def median(three)
	return three.sort[1]
end