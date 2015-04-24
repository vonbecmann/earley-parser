tests
testTop
	| anObject |
	anObject := 'hola'.
	stack push: anObject.
	self assert: stack top equals: anObject