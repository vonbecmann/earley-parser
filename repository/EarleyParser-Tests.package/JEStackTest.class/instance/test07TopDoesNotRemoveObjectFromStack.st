tests
test07TopDoesNotRemoveObjectFromStack

	| pushedObject |
	
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	