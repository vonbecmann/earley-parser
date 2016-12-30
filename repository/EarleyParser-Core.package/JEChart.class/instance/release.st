initialize-release
release
	items := nil.
	predictionItemsByNonterminal := nil.
	finalItemsByNonterminal := nil.
	itemsByKey
		ifNotNil: 
			[	itemsByKey do: [ :item | item release ].
				itemsByKey := nil ].
	super release