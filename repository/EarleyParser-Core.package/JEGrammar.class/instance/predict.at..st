private
predict: nonterminal at: chart
	"predict: add all respective predicted items for the given collection of rules"

	chart addAll: ((self alternativesOf: nonterminal) 
									collect: [ :rule | rule dotAtBeginning startedAt: chart ])