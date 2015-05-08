building
build
	"builds a directed hypergraph with the nodes and edges"

	| graph |
	graph := JEDirectedHypergraph nodes: nodes asArray hyperedges: edges asArray.
	self initialize.
	^ graph