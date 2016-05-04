tests
test04PopReturnsLastPushedObject
	| pushedObject |
	pushedObject := 'Something'.

	stack push: pushedObject.

	self assert: stack pop equals: pushedObject