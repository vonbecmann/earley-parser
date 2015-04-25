tests
testIncludes
	| one another a |
	a := JENonterminal named: 'A'.
	one := JEHNode labeled: a from: (JEChart number: 2) to: (JEChart number: 3).
	another := JEHNode labeled: a from: (JEChart number: 2) to: (JEChart number: 4).
	self deny: (one includes: another).
	self assert: (another includes: one)