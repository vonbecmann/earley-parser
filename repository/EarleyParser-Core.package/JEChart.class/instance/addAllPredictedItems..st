adding
addAllPredictedItems: aCollection
	"add all respective predicted items for the given collection of rules"

	^ aCollection collect: [ :rule | self addPredictedItem: rule ]