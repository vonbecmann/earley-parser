comparing
= aDottedRule
	self == aDottedRule
		ifTrue: [ ^ true ].
	self class == aDottedRule class
		ifFalse: [ ^ false ].
	^ self dotIndex == aDottedRule dotIndex and: [ self rule == aDottedRule rule ]