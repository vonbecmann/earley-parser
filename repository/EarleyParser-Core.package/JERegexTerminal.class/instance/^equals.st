comparing
= anObject
	self class = anObject class
		ifFalse: [ ^ false ].
	self regex = anObject regex
		ifFalse: [ ^ false ].
	^ true