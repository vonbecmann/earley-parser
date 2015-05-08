tests
testLessThanOrEqual
	| one another |
	one := JEHypernode labeled: (JENonterminal named: 'A') from: (JEChart number: 2) to: (JEChart number: 3).
	another := JEHypernode labeled: (JENonterminal named: 'A') from: (JEChart number: 2) to: (JEChart number: 4).
	self assert: one <= another