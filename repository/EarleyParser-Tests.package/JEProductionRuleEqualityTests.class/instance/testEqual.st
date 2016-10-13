tests
testEqual
	| one other |
	one := (JENonterminal named: 'A') is: (JENonterminal named: 'A').
	other := (JENonterminal named: 'A') is: (JENonterminal named: 'A').
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self deny: one == other