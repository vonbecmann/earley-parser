printing
printOn: aStream
	"[ terminal = word @  [start chart number, end chart number ] ]"

	aStream nextPut: $[.
	terminal printOn: aStream.
	aStream nextPutAll: ' = '.
	word printOn: aStream.
	aStream nextPutAll: ' @ ['.
	startChart shortPrintOn: aStream.
	aStream nextPutAll: ', '.
	endChart shortPrintOn: aStream.
	aStream nextPutAll: ']]'