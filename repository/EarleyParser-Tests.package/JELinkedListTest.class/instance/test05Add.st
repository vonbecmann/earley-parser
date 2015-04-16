tests
test05Add
	self assert: list isEmpty.
	list
		add: 1;
		add: 2.
	self deny: list isEmpty.
	self assert: list size equals: 2