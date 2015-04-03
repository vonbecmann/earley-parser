printing
printOn: aStream
	"[ dotted rule @ start chart number ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream
		space;
		nextPut: $@;
		space.
	startChart shortPrintOn: aStream.
	aStream nextPut: $]