comparing
hash
	"label is not part of my identity."

	| hash |
	hash := targetNode identityHash.
	sourceNodes do: [ :elem | hash := (hash + elem identityHash) hashMultiply ].
	^ hash