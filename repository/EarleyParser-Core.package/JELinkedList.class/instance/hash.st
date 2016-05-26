comparing
hash
	| hash |
	hash := self class hash.
	self do: [ :each | hash := (hash + each hash) hashMultiply ].
	^ hash