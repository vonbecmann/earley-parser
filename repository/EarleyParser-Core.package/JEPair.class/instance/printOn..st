printing
printOn: aStream
	aStream nextPut: $(.
	first printOn: aStream.
	aStream nextPutAll: ' . '.
	second printOn: aStream.
	aStream nextPut: $)