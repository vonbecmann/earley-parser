building
build
	"builds a directed hypergraph with the nodes and edges"

	| graph |
	edges do: [ :each | each targetNode addSourceNodesFrom: each ].
	graph := JEDirectedHypergraph nodes: nodes asArray hyperedges: edges asArray.
	self initialize.
	^ graph