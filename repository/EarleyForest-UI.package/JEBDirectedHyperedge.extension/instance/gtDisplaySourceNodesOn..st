*EarleyForest-UI
gtDisplaySourceNodesOn: aStream
	aStream nextPut: ${.
	sourceNodes do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $}