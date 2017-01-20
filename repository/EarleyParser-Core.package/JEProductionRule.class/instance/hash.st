comparing
hash
	| hash |
	hash := ((self class hash + head hash) hashMultiply + body size hash) hashMultiply.
	body do: [ :each | hash := (hash + each hash) hashMultiply ].
	^ hash