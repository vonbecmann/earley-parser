printing
printOn: aStream
	"terminal = word @ [start, end]"

	self terminal printOn: aStream.
	aStream nextPut: $=.
	self word printOn: aStream.
	aStream
		space;
		nextPut: $@;
		space;
		nextPut: $[.
	self start shortPrintOn: aStream.
	aStream
		space;
		nextPut: $,.
	self end shortPrintOn: aStream.
	aStream nextPut: $]