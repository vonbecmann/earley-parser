building
build
	"builds a directed tree hypergraph with a root node, nodes and edges"

	| tree |
	root ifNil: [ ^ Error signal: 'root node cannot be nil' ].
	tree := JEBDTreeHypergraph root: root nodes: nodes hyperedges: edges.
	self reset.
	^ tree