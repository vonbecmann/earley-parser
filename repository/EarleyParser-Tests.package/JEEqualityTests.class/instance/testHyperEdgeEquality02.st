tests
testHyperEdgeEquality02
	| Start P T startChart endChart one another |
	Start := JENonterminal named: 'Start'.
	P := JENonterminal named: 'P'.
	T := JENonterminal named: 'T'.
	startChart := JEChart number: 1.
	endChart := JEChart number: 4.
	one := JEHyperedge
		nodes:
			{(JEHNode labeled: Start from: startChart to: endChart).
			(JEHNode labeled: P from: startChart to: endChart)} asSet.
	another := JEHyperedge
		nodes:
			{(JEHNode labeled: Start from: startChart to: endChart).
			(JEHNode labeled: T from: startChart to: endChart)} asSet.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash