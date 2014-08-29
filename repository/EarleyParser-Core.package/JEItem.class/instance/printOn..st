printing
printOn: aStream
	"[ rule, dotPosition, chart ]"

	aStream nextPut: $[.
	rule printOn: aStream.
	aStream
		nextPut: $,;
		space.
	dotPosition printOn: aStream.
	aStream
		nextPut: $,;
		space.
	chart printOn: aStream.
	aStream nextPut: $]