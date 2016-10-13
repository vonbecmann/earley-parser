tests
testEqual01
	| one other |
	one := (JENonterminal named: 'A') is_epsilon.
	other := (JENonterminal named: 'A') is_epsilon.
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self deny: one == other