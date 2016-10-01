printing
printOn: aStream
	aStream
		print: symbol;
		nextPutAll: ' @ [ ';
		print: start;
		nextPutAll: ', ';
		print: end;
		nextPutAll: ' ]'