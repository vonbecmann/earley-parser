comparing
hash
	^ (self class hash + (value hash + nextLink identityHash) hashMultiply) hashMultiply