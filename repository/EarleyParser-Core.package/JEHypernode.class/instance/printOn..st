printing
printOn: aStream
	aStream nextPut: $(.
	self label printOn: aStream.
	aStream
		nextPut: $,;
		space.
	self from shortPrintOn: aStream.
	aStream
		nextPut: $,;
		space.
	self to shortPrintOn: aStream.
	aStream nextPut: $)