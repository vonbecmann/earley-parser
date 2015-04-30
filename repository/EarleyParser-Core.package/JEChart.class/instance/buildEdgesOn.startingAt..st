hypergraph
buildEdgesOn: builder startingAt: anItem
	"build the hyperedges starting at an item like the given one"

	| queue visited givenItem |
	queue := JELinkedList new.
	visited := Set new.
	givenItem := self like: anItem.
	queue addLast: givenItem.
	visited add: givenItem.
	[ queue isEmpty ]
		whileFalse: [ 
			| item |
			item := queue removeFirst.
			item edges
				do: [ :edge | 
					edge buildEdgesOn: builder.
					(visited includes: edge to)
						ifFalse: [ queue addLast: edge to ] ] ]