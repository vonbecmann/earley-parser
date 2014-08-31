printing
printOn: aStream
	"Chart [number]"

	aStream nextPutAll: 'Chart ['.
	number printOn: aStream.
	aStream nextPut: $]