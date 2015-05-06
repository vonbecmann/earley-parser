private
predictionItemsAt: nonterminal
	^ predictionItemsByNonterminal at: nonterminal ifAbsent: [ JELinkedList new ]