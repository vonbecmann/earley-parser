tests
testEdgeEquality
	| chart plus rule to from one another |
	chart := JEChart number: 1.
	plus := JETerminal symbol: #+.
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			plus.
			(JENonterminal named: 'P')}.
	to := (rule dotAt: 2) startedAt: chart.
	from := (rule dotAt: 3) startedAt: chart.
	one := JEDirectedEdge labeled: plus from: from to: to.
	another := JEDirectedEdge labeled: plus from: from to: to.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash