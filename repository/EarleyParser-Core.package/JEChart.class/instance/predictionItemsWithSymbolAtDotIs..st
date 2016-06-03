accessing
predictionItemsWithSymbolAtDotIs: aNonterminal
	^ predictionItemsByNonterminal at: aNonterminal ifAbsent: [ Array empty ]