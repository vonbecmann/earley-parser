printing
printOn: aStream
	"head ::= body"

	self head printOn: aStream.
	aStream nextPutAll: ' ::= '.
	self body do: [ :each | each printOn: aStream ] separatedBy: [ aStream space ]