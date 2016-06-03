tests-accessing
testAtPutAll01
	dict at: 'A' putAll: {1}.

	self assert: (dict at: 'A') equals: (OrderedCollection with: 1)