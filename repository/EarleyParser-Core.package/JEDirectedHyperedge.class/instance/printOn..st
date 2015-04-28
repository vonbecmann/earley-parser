printing
printOn: aStream
	aStream nextPut: $(.
	aStream nextPut: ${.
	sourceNodes
		do: [ :each | each printOn: aStream ]
		separatedBy: [ 
			aStream
				nextPut: $,;
				space ].
	aStream
		nextPut: $};
		nextPut: $,;
		space.
	targetNode printOn: aStream.
	aStream nextPut: $)