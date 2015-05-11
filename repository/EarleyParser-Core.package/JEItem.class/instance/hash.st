comparing
hash
	^ endChart isNil
		ifTrue: [ self class hash bitXor: (dottedRule hash bitXor: startChart hash) ]
		ifFalse: [ self class hash bitXor: (dottedRule hash bitXor: (startChart hash bitXor: endChart hash)) ]