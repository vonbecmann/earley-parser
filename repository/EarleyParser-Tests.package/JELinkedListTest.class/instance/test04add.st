tests
test04add
	self assert: list isEmpty.
	list add: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1