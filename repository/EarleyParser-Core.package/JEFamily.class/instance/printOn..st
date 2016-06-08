printing
printOn: aStream
	aStream nextPut: $(.
	members first
		ifNotNil: [ 
			aStream print: members first.
			members second
				ifNotNil: [ 
					aStream
						nextPutAll: ', ';
						print: members second ] ].
	aStream nextPut: $)