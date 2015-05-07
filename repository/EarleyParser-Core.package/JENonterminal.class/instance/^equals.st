comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self named == anObject named
		ifFalse: [ ^ false ].
	^ true