printing
printOn: aStream
	"<symbolName>"

	aStream nextPut: $<.
	symbolName asString printOn: aStream.
	aStream nextPut: $>