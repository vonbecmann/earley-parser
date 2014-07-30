as yet unclassified
printOn: aStream
	"left -> right"

	left printOn: aStream.
	aStream nextPutAll: '->'.
	right printElementsOn: aStream