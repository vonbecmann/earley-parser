printing
printOn: aStream
	aStream
		print: charSet asString;
		nextPutAll: 'CharSetComplement'