tests
test01addLast
	self assert: list isEmpty.
	list addLast: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1