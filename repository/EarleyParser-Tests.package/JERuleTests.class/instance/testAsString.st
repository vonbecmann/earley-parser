tests
testAsString
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: #().
	self assert: rule asString equals: 'T = epsilon.'