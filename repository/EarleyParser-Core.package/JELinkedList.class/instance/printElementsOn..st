printing
printElementsOn: aStream
	aStream nextPut: $(.
	self
		do: [ :element | aStream print: element ]
		separatedBy: [ aStream space ].
	aStream nextPut: $)