tests
testAsString
	self assert: (JELink value: 1) asString equals: 'JELink(1)'.
	self assert: (JELink value: 1 next: nil) asString equals: 'JELink(1)'