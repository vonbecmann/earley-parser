printing
printOn: aStream
	" value @  [start, end]"

	value printOn: aStream.
	aStream
		space;
		nextPut: $@;
		space.
	aStream nextPut: $[.
	start printOn: aStream.
	aStream
		nextPut: $,;
		space.
	end printOn: aStream.
	aStream nextPut: $]