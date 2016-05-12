building
build
	"builds a directed hypergraph with the nodes and edges"

	| graph edges |
	edges := JELinkedList new.
	nodes do: [ :node | node backwardStar do: [ :edge | edges addLast: edge ] ].
	graph := JEBDirectedHypergraph nodes: nodes asArray hyperedges: edges asArray.
	self reset.
	^ graph