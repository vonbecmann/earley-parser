comparing
= aDottedRule
	self == aDottedRule
		ifTrue: [ ^ true ].
	self class == aDottedRule class
		ifFalse: [ ^ false ].
	self dotIndex == aDottedRule dotIndex
		ifFalse: [ ^ false ].
	self rule == aDottedRule rule
		ifFalse: [ ^ false ].
	^ true