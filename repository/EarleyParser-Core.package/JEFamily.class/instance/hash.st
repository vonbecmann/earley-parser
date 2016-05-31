comparing
hash
	| hash |
	hash := self class hash.
	members do: [ :packedNode | hash := (hash + packedNode identityHash) hashMultiply ].
	^ hash