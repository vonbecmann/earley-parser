printing
printOn: aStream
	"head -> body with dot"

	rule head printOn: aStream.
	aStream
		space;
		nextPutAll: '->';
		space.
	rule body
		withIndexDo: [ :each :index | 
			index = dotIndex
				ifTrue: [ aStream nextPut: $* ].
			each printOn: aStream ].
	rule body size < dotIndex
		ifTrue: [ aStream nextPut: $* ]