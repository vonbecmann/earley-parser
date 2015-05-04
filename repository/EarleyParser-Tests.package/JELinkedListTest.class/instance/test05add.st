tests
test05add
	self assert: list isEmpty.
	list
		add: 1;
		add: 2.
	self deny: list isEmpty.
	self assert: list size equals: 2.
	self assert: list first equals: 1