printing
printOn: aStream
	"[ terminal = word @  [start chart number, end chart number ] ]"

	aStream nextPut: $[.
	self terminal printOn: aStream.
	aStream nextPutAll: ' = '.
	word printOn: aStream.
	aStream nextPutAll: ' @ ['.
	self startChart shortPrintOn: aStream.
	aStream nextPutAll: ', '.
	self endChart shortPrintOn: aStream.
	aStream nextPutAll: '] '