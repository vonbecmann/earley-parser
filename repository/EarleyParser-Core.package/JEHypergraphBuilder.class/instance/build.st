building
build
	"builds a graph with the nodes and edges"

	| graph |
	graph := JEDirectedHypergraph nodes: nodes hyperedges: edges.
	self initialize.
	^ graph