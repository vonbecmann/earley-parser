printing
printOn: aStream
	aStream nextPut: ${.
	nodes
		do: [ :each | each printOn: aStream ]
		separatedBy: [ 
			aStream
				nextPut: $,;
				space ].
	aStream nextPut: $}