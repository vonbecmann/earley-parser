tests-accessing
testAtPutAll02
	dict at: 'A' putAll: {}.

	self assert: (dict at: 'A') equals: OrderedCollection new