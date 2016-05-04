tests
test06TopReturnsLastPushedObject
	| pushedObject |
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top equals: pushedObject