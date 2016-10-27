printing
printOn: aStream
	aStream
		nextPut: $(;
		print: first;
		nextPutAll: ', ';
		print: second;
		nextPut: $)