comparing
hash
	^ self class hash bitXor: (self value hash bitXor: (self start hash bitXor: self end hash))