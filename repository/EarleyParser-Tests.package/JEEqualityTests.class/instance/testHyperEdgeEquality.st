tests
testHyperEdgeEquality
	| Start P startChart endChart one another |
	Start := JENonterminal named: 'Start'.
	P := JENonterminal named: 'P'.
	startChart := JEChart number: 1.
	endChart := JEChart number: 4.
	one := JEHyperedge
		nodes:
			{(JEHNode labeled: Start from: startChart to: endChart).
			(JEHNode labeled: P from: startChart to: endChart)} asSet.
	another := JEHyperedge
		nodes:
			{(JEHNode labeled: Start from: startChart to: endChart).
			(JEHNode labeled: P from: startChart to: endChart)} asSet.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash