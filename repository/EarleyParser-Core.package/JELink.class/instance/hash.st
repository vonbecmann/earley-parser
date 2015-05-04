comparing
hash
	^ self class hash bitXor: (self value hash bitXor: self nextLink identityHash)