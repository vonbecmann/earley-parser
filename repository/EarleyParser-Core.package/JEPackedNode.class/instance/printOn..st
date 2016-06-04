printing
printOn: aStream
	aStream
		nextPut: $(;
		print: model;
		nextPut: $)