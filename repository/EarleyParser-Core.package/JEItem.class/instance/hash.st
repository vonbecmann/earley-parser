comparing
hash
	| hash |
	hash := (self class hash bitXor: dottedRule hash) bitXor: startChart hash.
	^ endChart isNil
		ifTrue: [ hash ]
		ifFalse: [ hash bitXor: endChart hash ]