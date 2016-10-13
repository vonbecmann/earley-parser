tests
testEqual02
	| one other |
	one := (JENonterminal named: 'A') is: (JENonterminal named: 'B').
	other := (JENonterminal named: 'A') is: (JENonterminal named: 'A').
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: one == other