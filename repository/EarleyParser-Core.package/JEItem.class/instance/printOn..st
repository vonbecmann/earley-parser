printing
printOn: aStream
	"[ rule, dotPosition, itemset ]"

	aStream nextPut: $[.
	rule printOn: aStream.
	aStream
		nextPut: $,;
		space.
	dotPosition printOn: aStream.
	aStream
		nextPut: $,;
		space.
	itemset printOn: aStream.
	aStream nextPut: $]