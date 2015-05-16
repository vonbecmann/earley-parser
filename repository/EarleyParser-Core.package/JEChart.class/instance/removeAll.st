as yet unclassified
removeAll
	items removeAll.
	itemsByChart do: [ :each | each removeAll ].
	predictionItemsByNonterminal removeAll