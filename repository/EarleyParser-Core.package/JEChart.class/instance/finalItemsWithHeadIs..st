accessing
finalItemsWithHeadIs: aNonterminal
	^ finalItemsByNonterminal at: aNonterminal ifAbsent: [ Array empty ]