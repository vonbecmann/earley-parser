printing
printOn: aStream
	aStream nextPut: $(.
	first
		ifNotNil: [ 
			aStream print: first.
			second
				ifNotNil: [ 
					aStream
						nextPutAll: ', ';
						print: second ] ].
	aStream nextPut: $)