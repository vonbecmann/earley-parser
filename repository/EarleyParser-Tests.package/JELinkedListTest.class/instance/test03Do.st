tests
test03Do
	| sum |
	sum := 0.
	self assert: list isEmpty.
	list
		addLast: 1;
		addLast: 2;
		addLast: 3.
	list do: [ :each | sum := sum + each ].
	self deny: list isEmpty.
	self assert: sum equals: 6.
	self assert: list size equals: 3