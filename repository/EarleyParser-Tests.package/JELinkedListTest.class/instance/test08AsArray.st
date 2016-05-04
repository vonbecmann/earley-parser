tests
test08AsArray

	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.

	self assert: list asArray equals: #(1 2 3 4)