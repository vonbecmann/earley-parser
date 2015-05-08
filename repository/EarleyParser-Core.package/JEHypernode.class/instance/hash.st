comparing
hash
	^ self class hash bitXor: (self label hash bitXor: (self from identityHash bitXor: self to identityHash))