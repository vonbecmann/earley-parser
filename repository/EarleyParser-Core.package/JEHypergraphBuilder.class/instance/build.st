building
build
	"builds a directed hypergraph with the nodes and edges"

	| graph |
	graph := JEDirectedHypergraph nodes: nodes hyperedges: edges.
	self initialize.
	^ graph