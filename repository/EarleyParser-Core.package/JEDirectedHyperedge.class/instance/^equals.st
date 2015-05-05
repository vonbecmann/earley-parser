comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self targetNode == anObject targetNode
		ifFalse: [ ^ false ].
	self sourceNodes size = anObject sourceNodes size
		ifFalse: [ ^ false ].
	^ self sourceNodes allSatisfy: [ :each | anObject includes: each ]