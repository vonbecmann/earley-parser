tests
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	stack push: 'Something'.
	stack pop.

	self
		should: [ stack pop ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'collection is empty!' ]