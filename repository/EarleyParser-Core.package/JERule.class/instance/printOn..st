printing
printOn: aStream
	"head ::= body"

	head printOn: aStream.
	aStream
		space;
		nextPutAll: '::=';
		space.
	body do: [ :each | each printOn: aStream ]