adding edges
addEdgesStartingAt: aJEItem
	"add the hyperedges starting at the given item"

	| visited queue |
	visited := Set new.
	queue := JELinkedList with: aJEItem.
	[ queue isEmpty ]
		whileFalse: [ 
			| item |
			item := queue removeFirst.
			visited add: item.
			item pointers
				do: [ :pointer | 
					pointer addEdgesTo: self.
					(pointer to isPredicted or: [ visited includes: pointer to ])
						ifFalse: [ queue addLast: pointer to ].
					(pointer down isNil or: [ visited includes: pointer down ])
						ifFalse: [ queue addLast: pointer down ] ] ]