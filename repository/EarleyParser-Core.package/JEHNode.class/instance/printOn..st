printing
printOn: aStream
	aStream nextPut: $(.
	label printOn: aStream.
	aStream
		nextPut: $,;
		space.
	from shortPrintOn: aStream.
	aStream
		nextPut: $,;
		space.
	to shortPrintOn: aStream.
	aStream nextPut: $)