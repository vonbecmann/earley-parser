tests
testAddEdgeWithEmptySources
	| item first |
	first := JEChart number: 1.
	item := (JERule head: (JENonterminal named: 'F') body: {}) dotAtEnd startedAt: first.
	item addEdgeWithSources: #().
	self assert: item node indegree equals: 1