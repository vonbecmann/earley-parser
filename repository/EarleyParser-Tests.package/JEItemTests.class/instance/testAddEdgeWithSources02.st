tests
testAddEdgeWithSources02
	| first middle last rule target previous scanned edge |
	first := JEChart number: 1.
	middle := JEChart number: 3.
	last := JEChart number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body:
			{(JENonterminal named: 'G').
			(JETerminal character: $H)}.
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	scanned := JEHypernode model: ((JETerminal character: $H) startedAt: middle number andEndedAt: last number).
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	edge := JEDirectedHyperedge
		labeled: rule
		sourceNodes:
			{previous node.
			scanned}
		targetNode: target node.


	target
		addEdgeWithSources:
			{previous node.
			scanned}.

	self assert: target node indegree equals: 1.
	self assert: (target node backwardStar detect: [ :each | each = edge ] ifFound: [ true ] ifNone: [ false ])