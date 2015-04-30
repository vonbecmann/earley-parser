hypergraph
buildEdgesOn: builder startingAt: anItem
	"build the hyperedges starting at an item like the given one"

	self buildEdgesOn: builder from: (self like: anItem)