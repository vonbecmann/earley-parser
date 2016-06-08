comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	members first == anObject first
		ifFalse: [ ^ false ].
	members second == anObject second
		ifFalse: [ ^ false ].
	^ true