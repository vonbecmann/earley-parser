tests
test07removeAll
	| copied |
	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.
	copied := list copy.
	list removeAll.
	self assert: list size equals: 0.
	self assert: copied size equals: 4