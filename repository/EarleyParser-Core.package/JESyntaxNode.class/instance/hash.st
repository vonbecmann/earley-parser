comparing
hash
	^ (self class hash + (self value hash + (start hash + end hash) hashMultiply) hashMultiply) hashMultiply