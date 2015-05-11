comparing
hash
	| hash |
	hash := ((self class hash bitXor: label hash) bitXor: from hash) bitXor: to hash.
	^ self down isNil
		ifTrue: [ hash ]
		ifFalse: [ hash bitXor: down hash ]