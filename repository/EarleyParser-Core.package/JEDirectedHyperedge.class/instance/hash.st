comparing
hash
	"label is not part of my identity."

	| hash |
	hash := ((self class hash + targetNode identityHash) hashMultiply + sourceNodes size hash) hashMultiply.
	sourceNodes do: [ :elem | hash := (hash + elem identityHash) hashMultiply ].
	^ hash