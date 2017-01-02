initialize-release
release
	"an item set has references to items and an item has references to an item set"

	items := nil.
	predictionItemsByNonterminal := nil.
	finalItemsByNonterminal := nil.
	itemsByKey
		ifNotNil: 
			[	itemsByKey do: [ :item | item release ].
				itemsByKey := nil ].
	super release