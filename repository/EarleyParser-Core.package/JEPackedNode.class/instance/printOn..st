printing
printOn: aStream
	aStream nextPut: $(.
	self model printOn: aStream.
	aStream nextPut: $)