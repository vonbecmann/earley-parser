printing
printOn: aStream
	"head ::= body"

	self head printOn: aStream.
	aStream
		space;
		nextPutAll: '::=';
		space.
	self body do: [ :each | each printOn: aStream ]