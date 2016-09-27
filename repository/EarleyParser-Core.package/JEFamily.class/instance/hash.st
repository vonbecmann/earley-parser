comparing
hash
	| hash |
	hash := (self class hash + parent identityHash) hashMultiply.
	first
		ifNotNil: 
			[	hash := (hash + first identityHash) hashMultiply.
				second ifNotNil: [ hash := (hash + second identityHash) hashMultiply ] ].
	^ hash