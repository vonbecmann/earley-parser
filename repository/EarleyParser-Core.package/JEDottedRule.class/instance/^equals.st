comparing
= aDottedRule
	self == aDottedRule
		ifTrue: [ ^ true ].
	self class == aDottedRule class
		ifFalse: [ ^ false ].
	^ dotIndex == aDottedRule dotIndex and: [ rule == aDottedRule rule ]