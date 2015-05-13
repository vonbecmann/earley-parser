tests
testHypergraphGiven3Xs
	| graph |
	graph := grammar hypergraph: 'xxx'.
	self assert: graph nodesSize equals: 18.
	self assert: graph edgesSize equals: 16