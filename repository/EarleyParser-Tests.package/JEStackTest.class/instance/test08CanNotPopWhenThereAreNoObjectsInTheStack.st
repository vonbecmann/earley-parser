tests
test08CanNotPopWhenThereAreNoObjectsInTheStack
	self
		should: [ stack pop ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'collection is empty!' ]