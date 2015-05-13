tests
testPop02
	| anObject |
	anObject := 'hola'.
	stack push: anObject.
	self assert: stack pop equals: anObject.
	self assert: stack isEmpty.
	self assert: stack size equals: 0