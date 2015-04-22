comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self nodes size = anObject nodes size
		ifFalse: [ ^ false ].
	^ self nodes allSatisfy: [ :each | anObject includes: each ]