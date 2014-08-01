printing
printOn: aStream
	"{symbol}"

	aStream nextPut: ${.
	symbol asString printOn: aStream.
	aStream nextPut: $}