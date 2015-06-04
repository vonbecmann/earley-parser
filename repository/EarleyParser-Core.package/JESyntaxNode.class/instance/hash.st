comparing
hash
	^ self class hash bitXor: (self value hash bitXor: (start hash bitXor: end hash))