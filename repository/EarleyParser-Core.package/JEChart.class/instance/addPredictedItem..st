adding
addPredictedItem: aRule
	"add the respective predicted item for a given rule"

	^ self add: (aRule dotAtBeginning startedAt: self)