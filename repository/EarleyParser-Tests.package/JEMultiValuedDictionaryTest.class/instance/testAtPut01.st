tests-accessing
testAtPut01
	dict at: 'A' put: 1.
	dict at: 'A' put: 2.
	
	self assert: (dict at: 'A') equals: (OrderedCollection with: 1 with: 2)