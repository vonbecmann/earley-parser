private
predictionItemsAt: nonterminal put: anItem
	(predictionItemsByNonterminal at: nonterminal ifAbsentPut: [ JELinkedList new ]) add: anItem.
	^ anItem