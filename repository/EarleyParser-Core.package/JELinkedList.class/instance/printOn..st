printing
printOn: aStream
	"Append a sequence of characters that identify the receiver to aStream."

	super printOn: aStream.
	aStream nextPut: $(.
	self do: [ :element | aStream print: element ] separatedBy: [ aStream space ].
	aStream nextPut: $)