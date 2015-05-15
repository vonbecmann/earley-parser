comparing
hash
	^ (self class hash bitXor: self word hash) hashMultiply bitXor: self terminal hash