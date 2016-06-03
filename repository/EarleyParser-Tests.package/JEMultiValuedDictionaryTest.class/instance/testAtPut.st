tests-accessing
testAtPut
	dict at: 'A' put: 1.

	self assert: (dict at: 'A') equals: (OrderedCollection with: 1)