comparing
hash
	| hash |
	hash := self class hash.
	members first
		ifNotNil: [ 
			hash := (hash + members first identityHash) hashMultiply.
			members second 
				ifNotNil: [ hash := (hash + members second identityHash) hashMultiply ] ].
	^ hash