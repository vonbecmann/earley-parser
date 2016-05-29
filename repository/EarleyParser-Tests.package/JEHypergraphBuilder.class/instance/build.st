building
build
	"builds a directed hypergraph with the nodes and edges"

	| graph |
	graph := JEBDirectedHypergraph nodes: nodes hyperedges: edges.
	self reset.
	^ graph