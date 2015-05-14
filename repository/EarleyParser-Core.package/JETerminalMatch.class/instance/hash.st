comparing
hash
	^ (((self class hash 
			bitXor: self word hash) hashMultiply 
				bitXor: self terminal hash) 
					bitXor: self startChart hash)
						bitXor: self endChart hash