printing
printOn: aStream
	"head: body.
	 head: . "

	head printOn: aStream.
	aStream nextPutAll: ': '.
	body do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $.