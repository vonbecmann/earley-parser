hypergraph
buildEdgesOn: builder startingAt: anItem
	"build the hyperedges starting at an item like the given one"

	| visited queue |
	visited := Set new.
	queue := JELinkedList with: (self like: anItem).
	[ queue isEmpty ]
		whileFalse: [ 
			| item |
			item := queue removeFirst.
			visited add: item.
			item pointers
				do: [ :pointer | 
					pointer buildEdgesOn: builder.
					(pointer to isPredicted or: [ visited includes: pointer to ])
						ifFalse: [ queue addLast: pointer to ].
					(pointer down isNil or: [ visited includes: pointer down ])
						ifFalse: [ queue addLast: pointer down ] ] ]