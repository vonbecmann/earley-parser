tests
testHypergraphGiven3Xs
	| graph |
	graph := grammar hypergraph: 'xxx'.
	self assert: graph nodesSize equals: 8.
	self assert: graph edgesSize equals: 5