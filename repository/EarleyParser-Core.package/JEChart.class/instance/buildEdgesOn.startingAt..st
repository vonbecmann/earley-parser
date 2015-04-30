hypergraph
buildEdgesOn: builder startingAt: anItem
	"build the hyperedges starting at an item like the given one"

	| stack |
	stack := JEStack new.
	stack push: (self like: anItem).
	[ stack isEmpty ]
		whileFalse: [ 
			| item |
			item := stack pop.
			item edges
				do: [ :edge | 
					edge buildEdgesOn: builder.
					stack push: edge to ] ]