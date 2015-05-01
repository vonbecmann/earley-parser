tests
testHypergraphGiven3Xs
	| graph |
	graph := grammar hypergraph: #(x x x).
	self assert: graph nodesSize equals: 8.
	self assert: graph edgesSize equals: 5