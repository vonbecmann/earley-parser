printing
printOn: aStream
	"[ dotted rule, chart ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream
		nextPut: $,;
		space.
	chart printOn: aStream.
	aStream nextPut: $]