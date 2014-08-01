printing
printOn: aStream
	"left -> right"

	left printOn: aStream.
	aStream
		space;
		nextPutAll: '->';
		space.
	right do: [ :each | each printOn: aStream ]