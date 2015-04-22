tests
testNodeEquality
	| Start startChart endChart one another |
	Start := JENonterminal named: 'Start'.
	startChart := JEChart number: 1.
	endChart := JEChart number: 4.
	one := JEHNode labeled: Start from: startChart to: endChart.
	another := JEHNode labeled: Start from: startChart to: endChart.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash