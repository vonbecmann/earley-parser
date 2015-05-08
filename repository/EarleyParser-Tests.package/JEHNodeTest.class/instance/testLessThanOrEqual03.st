tests
testLessThanOrEqual03
	| one another |
	one := JEHypernode labeled: (JENonterminal named: 'A') from: (JEChart number: 2) to: (JEChart number: 4).
	another := JEHypernode labeled: (JENonterminal named: 'A') from: (JEChart number: 2) to: (JEChart number: 3).
	self deny: one <= another