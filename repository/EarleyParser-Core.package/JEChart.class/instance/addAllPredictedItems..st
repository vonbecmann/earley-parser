adding
addAllPredictedItems: aCollection
	"add all respective predicted item for the given collection of rules"

	aCollection do: [ :rule | self addPredictedItem: rule ].
	^ aCollection