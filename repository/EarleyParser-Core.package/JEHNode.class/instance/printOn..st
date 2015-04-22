printing
printOn: aStream
	aStream nextPut: $(.
	label printOn: aStream.
	aStream
		nextPut: $,;
		space.
	from printOn: aStream.
	aStream
		nextPut: $,;
		space.
	to printOn: aStream.
	aStream nextPut: $)