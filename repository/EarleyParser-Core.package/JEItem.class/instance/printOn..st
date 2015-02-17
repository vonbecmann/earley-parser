printing
printOn: aStream
	"[ rule, dotIndex, chart ]"

	aStream nextPut: $[.
	rule printOn: aStream.
	aStream
		nextPut: $,;
		space.
	dotIndex printOn: aStream.
	aStream
		nextPut: $,;
		space.
	chart printOn: aStream.
	aStream nextPut: $]