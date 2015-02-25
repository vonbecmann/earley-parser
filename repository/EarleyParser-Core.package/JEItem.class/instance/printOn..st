printing
printOn: aStream
	"[ dotted rule, chart ]"

	aStream nextPut: $[.
	rule printOn: aStream.
	aStream
		nextPut: $,;
		space.
	chart printOn: aStream.
	aStream nextPut: $]