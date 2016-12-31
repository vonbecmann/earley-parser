initialize-release
release
	"a chart has references to items and an item has references to charts"

	items := nil.
	predictionItemsByNonterminal := nil.
	finalItemsByNonterminal := nil.
	itemsByKey
		ifNotNil: 
			[	itemsByKey do: [ :item | item release ].
				itemsByKey := nil ].
	super release