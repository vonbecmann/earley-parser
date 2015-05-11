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
	(self down isNil and: [ anObject down isNil not ])
		ifTrue: [ ^ false ].
	(self down isNil not and: [ anObject down isNil ])
		ifTrue: [ ^ false ].
	(self down isNil or: [ anObject down isNil ])
		ifFalse: [ 
			self down = anObject down
				ifFalse: [ ^ false ] ].
	^ true