printing
printOn: aStream
	"terminal = word"

	terminal printOn: aStream.
	aStream nextPut: $=.
	word printOn: aStream