printing
printOn: aStream
	"[ dotted rule @ start chart number ]"

	"[ dotted rule @  [start chart number, end chart number ] ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream nextPutAll: ' @ '.
	self printChartOn: aStream.
	aStream nextPut: $]