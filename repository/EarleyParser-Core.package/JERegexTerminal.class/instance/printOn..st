printing
printOn: aStream
	self regex printOn: aStream.
	aStream nextPutAll: 'regex'