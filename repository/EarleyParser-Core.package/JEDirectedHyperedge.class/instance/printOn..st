printing
printOn: aStream
	aStream nextPut: ${.
	sourceNodes
		do: [ :each | each printOn: aStream ]
		separatedBy: [ 
			aStream
				nextPut: $,;
				space ].
	aStream
		nextPut: $};
		nextPut: $=;
		nextPut: $=;
		space.
	label printOn: aStream.
	aStream
		space;
		nextPut: $=;
		nextPut: $=;
		nextPut: $>;
		space.
	targetNode printOn: aStream