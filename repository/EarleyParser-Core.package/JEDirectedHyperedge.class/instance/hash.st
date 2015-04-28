comparing
hash
	| hash |
	hash := self class hash bitXor: targetNode hash.
	sourceNodes do: [ :elem | hash := hash bitXor: elem hash ].
	^ hash bitXor: sourceNodes size hash