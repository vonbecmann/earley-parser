comparing
hash
	| hash |
	hash := (self class hash + (targetNode identityHash + label hash) hashMultiply) hashMultiply.
	sourceNodes do: [ :elem | hash := (hash + elem identityHash) hashMultiply ].
	^ (hash + sourceNodes size hash) hashMultiply