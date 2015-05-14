comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self value = anObject value
		ifFalse: [ ^ false ].
	^ true