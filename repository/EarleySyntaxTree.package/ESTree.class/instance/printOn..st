printing
printOn: aStream
	aStream
		print: self class;
		nextPut: $(;
		print: root;
		nextPut: $)