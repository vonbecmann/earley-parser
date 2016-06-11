printing
printOn: aStream
	"[terminal @ [start chart number, end chart number]]"

	aStream nextPut: $[.
	terminal printOn: aStream.
	aStream nextPutAll: ' @ '.
	self printChartOn: aStream.
	aStream nextPut: $]