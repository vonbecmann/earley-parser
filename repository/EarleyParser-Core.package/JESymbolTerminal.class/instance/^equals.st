comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self symbol = anObject symbol
		ifFalse: [ ^ false ].
	^ true