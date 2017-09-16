private
finalItemsByNonterminalAt: nonterminal put: anItem
	(finalItemsByNonterminal at: nonterminal ifAbsent: nil)
		ifNil: [ 
			finalItemsByNonterminal
				at: nonterminal
				put:
					(SinglyLinkedList new
						addLast: anItem;
						yourself) ]
		ifNotNil: [ :list | list addLast: anItem ]