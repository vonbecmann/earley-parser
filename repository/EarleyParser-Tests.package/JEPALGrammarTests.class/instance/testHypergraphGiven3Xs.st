tests
testHypergraphGiven3Xs
	| graph |
	graph := grammar hypergraph: 'xxx'.
	self assert: graph nodesSize equals: 14.
	self assert: graph edgesSize equals: 11