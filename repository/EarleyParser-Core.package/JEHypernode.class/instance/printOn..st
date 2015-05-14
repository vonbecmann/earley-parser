printing
printOn: aStream
	aStream nextPut: $(.
	self label printOn: aStream.
	aStream nextPut: $)