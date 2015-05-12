printing
printOn: aStream
	label printOn: aStream.
	aStream
		space;
		nextPutAll: 'from:'.
	from printOn: aStream.
	aStream
		space;
		nextPutAll: 'back to:'.
	to printOn: aStream.
	down isNil
		ifTrue: [ ^ self ].
	aStream
		space;
		nextPutAll: 'down to:'.
	down printOn: aStream