comparing
hash
	^ self class hash bitXor: (label hash bitXor: (from identityHash bitXor: to identityHash))