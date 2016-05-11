printing
printValues: values on: aStream
	values do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ]