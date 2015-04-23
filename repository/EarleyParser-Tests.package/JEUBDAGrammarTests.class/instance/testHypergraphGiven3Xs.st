tests
testHypergraphGiven3Xs
	| graph |
	graph := grammar hypergraph: #(x x x).
	self assert: graph nodes size equals: 13.
	self assert: graph edges size equals: 11