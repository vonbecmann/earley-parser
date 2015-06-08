comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self start = anObject start
		ifFalse: [ ^ false ].
	self end = anObject end
		ifFalse: [ ^ false ].
	self value = anObject value
		ifFalse: [ ^ false ].
	^ true