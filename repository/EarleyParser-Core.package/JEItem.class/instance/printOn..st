printing
printOn: aStream
	"[ dotted rule @ chart number ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream
		space;
		nextPut: $@;
		space.
	chart shortPrintOn: aStream.
	aStream nextPut: $]