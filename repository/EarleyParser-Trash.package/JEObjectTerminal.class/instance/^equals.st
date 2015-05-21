comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self object = anObject object
		ifFalse: [ ^ false ].
	^ true