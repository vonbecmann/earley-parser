tests
testEqual
	| one other |
	one := JEProductionRule
				head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
	other := JEProductionRule
					head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
					
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one == other