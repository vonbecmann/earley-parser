tests
test05StackBehavesLIFO
	| firstPushedObject secondPushedObject |
	
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop equals: secondPushedObject.
	self assert: stack pop equals: firstPushedObject.
	self assert: stack isEmpty