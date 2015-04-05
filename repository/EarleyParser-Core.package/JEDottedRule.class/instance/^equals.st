comparing
= aDottedRule
	self class == aDottedRule class
		ifFalse: [ ^ false ].
	dotIndex == aDottedRule dotIndex
		ifFalse: [ ^ false ].
	rule = aDottedRule rule
		ifFalse: [ ^ false ].
	^ true