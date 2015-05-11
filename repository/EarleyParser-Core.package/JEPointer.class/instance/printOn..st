printing
printOn: aStream
	label printOn: aStream.
	aStream
		space;
		nextPut: $(.
	from printOn: aStream.
	aStream
		nextPut: $,;
		space.
	to printOn: aStream.
	down isNil
		ifFalse: [ 
			aStream
				nextPut: $,;
				space.
			down printOn: aStream ].
	aStream nextPut: $)