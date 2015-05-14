comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self label = anObject label
		ifFalse: [ ^ false ].
	^ true