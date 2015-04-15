tests-adding
test01AddLast
	self assert: list isEmpty.
	list addLast: 1.
	self deny: list isEmpty