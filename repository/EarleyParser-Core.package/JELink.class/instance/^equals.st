comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	^ self value = anObject value and: [ self nextLink == anObject nextLink ]