tests
testEqual03
	| one other |
	one := JEProductionRule head: (JENonterminal named: 'A') body: #().
	other := JEProductionRule head: (JENonterminal named: 'C') body: #().
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other