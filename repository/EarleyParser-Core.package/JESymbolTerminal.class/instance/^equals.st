comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	symbol = anObject symbol
		ifFalse: [ ^ false ].
	^ true