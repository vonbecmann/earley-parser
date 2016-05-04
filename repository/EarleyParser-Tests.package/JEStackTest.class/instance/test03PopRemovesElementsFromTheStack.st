tests
test03PopRemovesElementsFromTheStack

	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty