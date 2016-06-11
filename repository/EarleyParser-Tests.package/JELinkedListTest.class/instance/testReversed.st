tests
testReversed
	| reversed |
	self assert: list isEmpty.
	list
		add: 2;
		add: 3.
	self deny: list isEmpty.
	reversed := list reversed.
	self deny: reversed isEmpty.
	self assert: reversed size equals: 2.
	self assert: reversed first equals: 3.
	self assert: reversed second equals: 2