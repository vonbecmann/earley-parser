printing
printOn: aStream
	"head = body with dot.
	 head = *. "

	self head printOn: aStream.
	aStream nextPutAll: ' = '.
	self rule body
		withIndexDo: [ :each :index | 
			index = 1
				ifFalse: [ aStream nextPutAll: ', ' ].
			index = self dotIndex
				ifTrue: [ aStream nextPut: $* ].
			each printOn: aStream ].
	self isFinal
		ifTrue: [ aStream nextPut: $* ].
	aStream nextPut: $.