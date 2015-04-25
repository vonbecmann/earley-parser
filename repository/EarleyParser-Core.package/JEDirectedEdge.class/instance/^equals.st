comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	self label = anObject label
		ifFalse: [ ^ false ].
	self from = anObject from
		ifFalse: [ ^ false ].
	self to = anObject to
		ifFalse: [ ^ false ].
	^ true