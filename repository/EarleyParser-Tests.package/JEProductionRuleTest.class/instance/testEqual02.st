tests
testEqual02
	| one other |
	one := JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'B')}.
	other := JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other