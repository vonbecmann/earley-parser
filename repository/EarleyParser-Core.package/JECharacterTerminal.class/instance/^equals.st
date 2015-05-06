comparing
= anObject
	self class = anObject class
		ifFalse: [ ^ false ].
	self character = anObject character
		ifFalse: [ ^ false ].
	^ true