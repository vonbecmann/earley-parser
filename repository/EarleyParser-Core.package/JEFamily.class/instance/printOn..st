printing
printOn: aStream
	aStream nextPut: $(.
	members do: [ :each | aStream print: each ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)