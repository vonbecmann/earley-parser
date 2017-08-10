private
predictionItemsByNonterminalAt: nonterminal put: anItem
	(predictionItemsByNonterminal at: nonterminal ifAbsent: nil)
		ifNil: [ 
			predictionItemsByNonterminal
				at: nonterminal
				put:
					(SinglyLinkedList new
						addLast: anItem;
						yourself) ]
		ifNotNil: [ :list | list addLast: anItem ]