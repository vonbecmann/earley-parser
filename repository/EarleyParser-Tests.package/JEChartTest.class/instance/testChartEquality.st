tests
testChartEquality
	| one another other |
	one := JEChart number: 1.
	another := JEChart number: 1.
	other := JEChart number: 2.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash