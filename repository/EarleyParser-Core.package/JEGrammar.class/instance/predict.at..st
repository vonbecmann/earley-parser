private
predict: item at: chart
	"predict: add all respective predicted items for the given collection of rules"

	chart addAll: ((self alternativesOf: item symbolAtDot) collect: [ :rule | rule dotAtBeginning startedAt: chart ])