printing
printOn: aStream
	"ItemSet [number]"

	aStream nextPutAll: 'ItemSet ['.
	number printOn: aStream.
	aStream nextPut: $]