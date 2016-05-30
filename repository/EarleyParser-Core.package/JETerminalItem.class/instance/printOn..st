printing
printOn: aStream
	"[ terminal @  [start chart number, end chart number ] ]"

	aStream nextPut: $[.
	self terminal printOn: aStream.
	aStream nextPutAll: ' @ ['.
	self startChart shortPrintOn: aStream.
	aStream nextPutAll: ', '.
	self endChart shortPrintOn: aStream.
	aStream nextPutAll: '] '