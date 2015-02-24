printing
printOn: aStream withDotAt: dotIndex
	"head -> body with dot"

	head printOn: aStream.
	aStream
		space;
		nextPutAll: '->';
		space.
	body
		withIndexDo: [ :each :index | 
			index = dotIndex
				ifTrue: [ aStream nextPut: $* ].
			each printOn: aStream ].
	body size < dotIndex
		ifTrue: [ aStream nextPut: $* ]