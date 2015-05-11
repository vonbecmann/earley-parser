tests
testPointerEquality04
	| chart P a rule to from down one another |
	chart := JEChart number: 1.
	P := JENonterminal named: 'P'.
	a := JETerminal character: $a.
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			P}.
	to := (rule dotAt: 3) startedAt: chart.
	from := rule dotAtEnd startedAt: chart.
	down := (P body: { a }) dotAtEnd startedAt: chart.
	one := JEPointer labeled: P from: from backTo: to downTo: down.
	another := JEPointer labeled: P from: from backTo: to.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash