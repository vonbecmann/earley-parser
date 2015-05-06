hypergraph
buildEdgesOn: builder startingAt: anItem
	"build the hyperedges starting at an item like the given one"

	| queue |
	queue := JELinkedList new.
	queue addLast: (self like: anItem).
	[ queue isEmpty ]
		whileFalse: [ 
			| item |
			item := queue removeFirst.
			item edges
				do: [ :edge | 
					edge buildEdgesOn: builder.
					queue addLast: edge to ] ]