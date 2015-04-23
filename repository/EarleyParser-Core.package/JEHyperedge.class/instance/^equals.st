comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self size = anObject size
		ifFalse: [ ^ false ].
	^ self nodes allSatisfy: [ :each | anObject includes: each ]