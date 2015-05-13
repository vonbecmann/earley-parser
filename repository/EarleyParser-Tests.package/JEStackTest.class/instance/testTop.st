tests
testTop
	| anObject |
	anObject := 'hola'.
	stack push: anObject.
	self assert: stack size equals: 1.
	self assert: stack top equals: anObject.
	self assert: stack size equals: 1