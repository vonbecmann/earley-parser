printing
printOn: aStream
	"head ::= body with dot"

	self head printOn: aStream.
	aStream nextPutAll: ' ::= '.
	self rule body
		withIndexDo: [ :each :index | 
			index = self dotIndex
				ifTrue: [ aStream nextPut: $* ]
				ifFalse: [ 
					index = 1
						ifFalse: [ aStream space ] ].
			each printOn: aStream ].
	self isFinal
		ifTrue: [ aStream nextPut: $* ]