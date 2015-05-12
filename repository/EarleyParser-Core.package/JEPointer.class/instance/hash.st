comparing
hash
	^ (((self class hash bitXor: label hash) bitXor: from hash) bitXor: to hash) bitXor: down hash