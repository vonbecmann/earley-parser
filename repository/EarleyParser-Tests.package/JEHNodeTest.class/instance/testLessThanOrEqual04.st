tests
testLessThanOrEqual04
	| one another |
	one := JEHNode labeled: (JENonterminal named: 'A') from: (JEChart number: 3) to: (JEChart number: 4).
	another := JEHNode labeled: (JENonterminal named: 'A') from: (JEChart number: 2) to: (JEChart number: 4).
	self deny: one <= another