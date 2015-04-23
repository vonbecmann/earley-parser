tests
testEdgeEquality02
	| chart P rule to from one another |
	chart := JEChart number: 1.
	P := JENonterminal named: 'P'.
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal symbol: #+).
			P}.
	to := (rule dotAt: 3) startedAt: chart.
	from := rule dotAtEnd startedAt: chart.
	one := JEEdge labeled: P from: from to: to.
	another := JEEdge labeled: P from: from to: to.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash