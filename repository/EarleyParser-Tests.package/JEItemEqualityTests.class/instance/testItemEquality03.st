tests
testItemEquality03
	| one another first rule |
	first := JEChart number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	another := (rule dotAt: 2) startedAt: first andEndedAt: (JEChart number: 4).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash