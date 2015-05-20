printing
printOn: aStream
	" value @  [start, end]"

	self value printOn: aStream.
	aStream
		space;
		nextPut: $@;
		space.
	aStream nextPut: $[.
	self start printOn: aStream.
	aStream
		nextPut: $,;
		space.
	self end printOn: aStream.
	aStream nextPut: $]