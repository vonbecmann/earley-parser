comparing
hash
	^ (self class hash + (self value hash + self nextLink identityHash) hashMultiply) hashMultiply