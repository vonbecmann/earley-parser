tests
testIsRepresentation01
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: {(JENonterminal named: 'P')}.
	self deny: rule isRepresentation