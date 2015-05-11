hypergraph
buildEdgesOn: builder startingAt: anItem
	"build the hyperedges starting at an item like the given one"

	| visited queue |
	visited := Set new.
	queue := JELinkedList new.
	queue addLast: (self like: anItem).
	[ queue isEmpty ]
		whileFalse: [ 
			| item |
			item := queue removeFirst.
			visited add: item.
			item edges
				do: [ :edge | 
					edge buildEdgesOn: builder.
					(edge to isPredicted or: [ visited includes: edge to ])
						ifFalse: [ queue addLast: edge to ].
					(edge down isNil or: [ visited includes: edge down ])
						ifFalse: [ queue addLast: edge down ] ] ]