running
testSetUp
	self assert: graph nodes isEmpty not.
	self assert: graph nodes size equals: 13.
	self assert: graph edges isEmpty not.
	self assert: graph edges size equals: 11