comparing
hash
	^ (((self class hash 
			bitXor: self word hash) hashMultiply 
				bitXor: self terminal hash) 
					bitXor: self start hash)
						bitXor: self end hash