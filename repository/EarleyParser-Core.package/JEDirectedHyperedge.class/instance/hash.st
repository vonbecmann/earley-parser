comparing
hash
	| hash |
	hash := self class hash bitXor: targetNode identityHash.
	sourceNodes do: [ :elem | hash := hash bitXor: elem identityHash ].
	^ hash bitXor: sourceNodes size hash