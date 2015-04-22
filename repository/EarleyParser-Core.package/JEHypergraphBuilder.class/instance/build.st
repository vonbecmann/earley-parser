building
build
	"builds a graph with the nodes and edges"

	| graph |
	graph := JEHypergraph nodes: nodes hyperedges: edges.
	self initialize.
	^ graph