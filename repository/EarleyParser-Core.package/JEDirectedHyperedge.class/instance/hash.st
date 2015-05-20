comparing
hash
	| hash |
	hash := self class hash bitXor: (targetNode identityHash bitXor: label hash).
	sourceNodes do: [ :elem | hash := hash bitXor: elem identityHash ].
	^ hash bitXor: sourceNodes size hash