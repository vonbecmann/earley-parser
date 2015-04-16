tests
testDottedRuleEquality02
	| one another rule anotherRule |
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal symbol: #+).
			(JENonterminal named: 'P')}.
	anotherRule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal symbol: #+).
			(JENonterminal named: 'P')}.
	one := rule dotAt: 2.
	another := anotherRule dotAt: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash