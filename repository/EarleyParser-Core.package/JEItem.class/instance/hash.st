comparing
hash
	^ ((self class hash bitXor: dottedRule hash) bitXor: startChart hash) bitXor: endChart hash