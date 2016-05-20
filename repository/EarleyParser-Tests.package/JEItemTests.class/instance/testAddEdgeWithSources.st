tests
testAddEdgeWithSources
	| first middle last rule target previous complete edge |
	first := JEChart number: 1.
	middle := JEChart number: 3.
	last := JEChart number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body:
			{(JENonterminal named: 'G').
			(JENonterminal named: 'H')}.
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	complete := (JERule head: (JENonterminal named: 'H') body: {(JENonterminal named: 'I')}) dotAtEnd startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	edge := JEDirectedHyperedge
		labeled: rule
		sourceNodes:
			{previous node.
			complete node}
		targetNode: target node.

	target
		addEdgeWithSources:
			{previous node.
			complete node}.

	self assert: target node indegree equals: 1.
	self assert: (target node backwardStar detect: [ :each | each = edge ] ifFound: [ true ] ifNone: [ false ])