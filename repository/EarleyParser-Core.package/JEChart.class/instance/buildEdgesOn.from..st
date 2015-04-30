hypergraph
buildEdgesOn: builder from: anItem
	"build the hyperedges starting from the given item"

	| itemsEdges |
	itemsEdges := edges select: [ :each | each from = anItem ].
	itemsEdges
		do: [ :edge | 
			edge buildEdgesOn: builder.
			edge to endChart buildEdgesOn: builder from: edge to ]