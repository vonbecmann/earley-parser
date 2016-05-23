printing
printOn: aStream
	"head ::= body.
	 head ::= epsilon. "

	self head printOn: aStream.
	aStream nextPutAll: ' = '.
	self body isEmpty
		ifTrue: [ aStream nextPutAll: 'epsilon' ]
		ifFalse: [ self body do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ] ].
	aStream nextPut: $.