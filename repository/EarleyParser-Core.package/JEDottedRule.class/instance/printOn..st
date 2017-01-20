printing
printOn: aStream
	"head: body with dot.
	 head: ·. "

	| middleDot |
	middleDot := Character value: 183.
	rule head printOn: aStream.
	aStream nextPutAll: ': '.
	rule body
		withIndexDo: [ :each :index | 
			index = 1
				ifFalse: [ aStream nextPutAll: ', ' ].
			index = self dotIndex
				ifTrue: [ aStream nextPut: middleDot ].
			each printOn: aStream ].
	self isFinal
		ifTrue: [ aStream nextPut: middleDot ].
	aStream nextPut: $.