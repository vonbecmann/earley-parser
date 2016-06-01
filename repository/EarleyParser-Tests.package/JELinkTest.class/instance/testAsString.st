tests
testAsString
	self assert: (JELink with: 1) asString equals: 'JELink(1)'.
	self assert: (JELink with: 1 next: nil) asString equals: 'JELink(1)'