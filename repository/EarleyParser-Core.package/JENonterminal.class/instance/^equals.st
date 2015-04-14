comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	name == anObject named
		ifFalse: [ ^ false ].
	^ true