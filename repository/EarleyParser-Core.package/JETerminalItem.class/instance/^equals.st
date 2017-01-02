comparing
= anObject
	self == anObject
		ifTrue: [ ^ true ].
	self class == anObject class
		ifFalse: [ ^ false ].
	start = anObject start
		ifFalse: [ ^ false ].
	end = anObject end
		ifFalse: [ ^ false ].
	terminal = anObject terminal
		ifFalse: [ ^ false ].
	^ true