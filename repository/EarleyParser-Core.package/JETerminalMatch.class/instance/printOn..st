printing
printOn: aStream
	"terminal = word"

	self terminal printOn: aStream.
	aStream nextPut: $=.
	self word printOn: aStream