# convert an hex string (8-bit ascii) to readable chars
def hex_to_ascii(hex)
	puts " * warning: hex string is #{hex.size} chars long" if hex.size%2 != 0
	ascii = ''
	for i in 0...hex.size/2 do
		ascii << hex[i*2,2].to_i(16).chr
	end
	return ascii
end

def ascii_to_hex(ascii)
	hex = ''
	for i in 0...ascii.size do
		h = ascii[i].to_s(16)
		hex << '0' if h.size == 1 # '0' padding
		hex << h
	end
	return hex
end

def ascii_xor(a, b)
	hex_to_ascii(hex_xor(ascii_to_hex(a), ascii_to_hex(b)))
end

def hex_xor(a, b, append=false)
	m = ""
	if a.length > b.length
		big = a
		small = b
	else
		big = b
		small = a
	end
	# xor each byte individually
	for i in 0...(small.length)
		hex = (a[i,1].to_i(16)^b[i,1].to_i(16)).to_s(16)
		m <<  hex # append to msg string in hex
	end
	if append # append the rest of the bigger string
		for i in small.length...big.length
			m << big[i,1]
		end
	end
	return m
end