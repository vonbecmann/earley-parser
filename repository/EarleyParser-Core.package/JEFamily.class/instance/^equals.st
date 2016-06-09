comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	^ members first == anObject first and: [ members second == anObject second ]