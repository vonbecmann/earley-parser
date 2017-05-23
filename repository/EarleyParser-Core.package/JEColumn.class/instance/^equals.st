comparing
= column
	self == column
		ifTrue: [ ^ true ].
	^ self class == column class and: [ number == column number ]