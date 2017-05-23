tests
testItemEquality04
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first andEndedAt: (JEColumn number: 3).
	another := (rule dotAt: 2) startedAt: first.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash