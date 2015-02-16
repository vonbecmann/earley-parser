adding
addPredictedItem: aRule
	"add the respective predicted item for a given rule"

	self add: (JEItem rule: aRule dotAtBeginningWithChart: self).
	^ aRule