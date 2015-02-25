comparing
= aDottedRule
	dotIndex = aDottedRule dotIndex
		ifFalse: [ ^ false ].
	rule = aDottedRule rule
		ifFalse: [ ^ false ].
	^ true