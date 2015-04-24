tests
testPush
	stack push: 'hola'.
	self deny: stack isEmpty.
	self assert: stack size equals: 1