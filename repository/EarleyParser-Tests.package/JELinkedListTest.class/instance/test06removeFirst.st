tests
test06removeFirst
	
	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.
	
	self assert: list size equals: 4.
	self assert: list first equals: 1.
	
	list removeFirst.
	self assert: list size equals: 3.
	self assert: list first equals: 2.
	
	list removeFirst.
	self assert: list size equals: 2.
	self assert: list first equals: 3.
	
	list removeFirst.
	self assert: list size equals: 1.
	self assert: list first equals: 4.
	
	list removeFirst.
	self assert: list isEmpty.
	self assert: list size equals: 0