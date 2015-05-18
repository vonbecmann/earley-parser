building
build
	"builds a directed hypergraph with the nodes and edges"

	| graph |
	graph := JEBDirectedHypergraph nodes: nodes asArray hyperedges: edges asArray.
	self reset.
	^ graph