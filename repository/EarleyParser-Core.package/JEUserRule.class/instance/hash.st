comparing
hash
	| hash |
	hash := ((self class hash + self head hash) hashMultiply + self body size hash) hashMultiply.
	self body do: [ :each | hash := (hash + each hash) hashMultiply ].
	^ hash