comparing
hash
	| hash |
	hash := targetNode identityHash.
	sourceNodes do: [ :elem | hash := (hash + elem identityHash) hashMultiply ].
	^ hash