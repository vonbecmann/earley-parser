printing
printOn: aStream
	"[ terminal @ [ start, end ] ]"

	aStream nextPut: $[.
	terminal printOn: aStream.
	aStream nextPutAll: ' @ '.
	self printIntervalOn: aStream.
	aStream nextPut: $]