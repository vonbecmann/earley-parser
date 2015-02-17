adding
addAllPredictedItems: aCollection
	"add all respective predicted items for the given collection of rules"

	aCollection do: [ :rule | self addPredictedItem: rule ].
	^ aCollection