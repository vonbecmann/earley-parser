tests
testSetUp
	self assert: graph nodesSize equals: 13.
	self assert: graph edgesSize equals: 11.
	self assert: graph size equals: 26