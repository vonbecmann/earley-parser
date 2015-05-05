comparing
hash
	| hash |
	hash := self class hash bitXor: targetNode identityHash.
	sourceNodes do: [ :elem | hash := hash bitXor: elem hash ].
	^ hash bitXor: sourceNodes size hash