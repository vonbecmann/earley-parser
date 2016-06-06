printing
printOn: aStream
	aStream nextPut: ${.
	sourceNodes
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream
		nextPutAll: '} ==> ';
		print: targetNode