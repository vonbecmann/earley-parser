tests-adding
test02AddLast
	self assert: list isEmpty.
	list
		addLast: 1;
		addLast: 2.
	self deny: list isEmpty.
	self assert: list size equals: 2