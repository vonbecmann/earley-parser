adding
addPredictedItem: aRule
	"add the respective predicted item for a given rule"

	self add: (JEItem given: aRule dotAtBeginning startedAt: self).
	^ aRule