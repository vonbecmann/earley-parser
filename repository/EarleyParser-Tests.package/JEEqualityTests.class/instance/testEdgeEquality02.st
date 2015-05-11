tests
testEdgeEquality02
	| chart P rule to from one another |
	chart := JEChart number: 1.
	P := JENonterminal named: 'P'.
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			P}.
	to := (rule dotAt: 3) startedAt: chart.
	from := rule dotAtEnd startedAt: chart.
	one := JEDirectedEdge labeled: P from: from backTo: to.
	another := JEDirectedEdge labeled: P from: from backTo: to.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash