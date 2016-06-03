tests-accessing
testAtPutAll
	dict at: 'A' putAll: {1 . 2}.

	self assert: (dict at: 'A') equals: (OrderedCollection with: 1 with: 2)