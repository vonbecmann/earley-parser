printing
printOn: aStream
	"head: body.
	 head: . "

	self head printOn: aStream.
	aStream nextPutAll: ': '.
	self body do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $.