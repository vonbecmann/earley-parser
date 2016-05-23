printing
printOn: aStream
	aStream
		print: self charset asString;
		nextPutAll: 'charset'