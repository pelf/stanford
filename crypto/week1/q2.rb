P = 295075153
@prgs = [
210205973,
22795300,
58776750,
121262470,
264731963,
140842553,
242590528,
195244728,
86752752]

def psg(x,y)
	# python:
	# x_{i+1} = 2*x_{i}+5  (mod p)
	# self.x = (2*self.x + 5) % self.p
	# 
	# # y_{i+1} = 3*y_{i}+7 (mod p)
	# self.y = (3*self.y + 7) % self.p
    # 
	# # z_{i+1} = x_{i+1} xor y_{i+1}
	# return (self.x ^ self.y)
	
	nx = (2*x + 5) % P
	ny = (3*y + 7) % P
	return nx^ny
end

# dumb solution: pure brute force 
def dumb
	# try to find the initial x and y values by brute force
	for x in 0...P
		puts '.'
		for y in 0...P
			if psg(x,y) == 210205973
				puts "match: #{x} #{y}"
			end
		end
	end
end

# try something smarter
def smarter
	for x in 0...P
		# puts x.to_s
		# try to match the prg sequence for every X
		# guess y from the xor
		x1 = (2*x + 5) % P # second x
		y1 = x1^@prgs[0] # second y fetched by xoring
		valid = true
		for prg in @prgs[1,8] do
			x1 = (2*x1 + 5) % P
			y1 = (3*y1 + 7) % P
			z = x1^y1
			# does it match the prg?
			unless z == prg
				valid = false
				break
			end
		end
		if valid
			puts "valid x: #{x}"
			break
		end
	end
end

smarter