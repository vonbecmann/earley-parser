comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self value = anObject value
		ifFalse: [ ^ false ].
	self nextLink == anObject nextLink
		ifFalse: [ ^ false ].
	^ true