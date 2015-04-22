comparing
hash
	| hash |
	hash := self class hash.
	nodes do: [ :elem | hash := hash bitXor: elem hash ].
	^ hash bitXor: nodes size hash