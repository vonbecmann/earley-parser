printing
printOn: aStream
	"[ dotted rule @ start ]"

	"[ dotted rule @  [ start, end ] ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream nextPutAll: ' @ '.
	self printIntervalOn: aStream.
	aStream nextPut: $]