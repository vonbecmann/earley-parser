initialize-release
release
	"a column has references to items and an item has references to a column"

	items := nil.
	predictionItemsByNonterminal := nil.
	finalItemsByNonterminal := nil.
	itemsByKey
		ifNotNil: 
			[	itemsByKey do: [ :item | item release ].
				itemsByKey := nil ].
	super release