tests
testEqual03
	| one other |
	one := (JENonterminal named: 'A') is_epsilon.
	other := (JENonterminal named: 'C') is_epsilon.
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: one == other