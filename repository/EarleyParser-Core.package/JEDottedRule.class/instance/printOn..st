printing
printOn: aStream
	"head ::= body with dot"

	self head printOn: aStream.
	aStream
		space;
		nextPutAll: '::=';
		space.
	self rule body
		withIndexDo: [ :each :index | 
			index = self dotIndex
				ifTrue: [ aStream nextPut: $* ].
			each printOn: aStream ].
	self isFinal
		ifTrue: [ aStream nextPut: $* ]