printing
printOn: aStream
	"[ rule with dot inside, chart ]"

	aStream nextPut: $[.
	rule printOn: aStream withDotAt: dotIndex.
	aStream
		nextPut: $,;
		space.
	chart printOn: aStream.
	aStream nextPut: $]