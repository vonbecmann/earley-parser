printing
printOn: aStream
	"Column [number]"

	aStream nextPutAll: 'Column ['.
	number printOn: aStream.
	aStream nextPut: $]