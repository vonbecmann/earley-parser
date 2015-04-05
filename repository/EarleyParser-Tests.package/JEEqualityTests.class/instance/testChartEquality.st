tests
testChartEquality
	| one another other |
	one := JEChart number: 1.
	another := JEChart number: 1.
	other := JEChart number: 2.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash.
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash