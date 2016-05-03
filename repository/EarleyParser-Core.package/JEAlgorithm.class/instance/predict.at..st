private operations
predict: nonterminal at: chart
	"predict: add all respective predicted items for the given collection of rules"

	(grammar alternativesOf: nonterminal) do: [ :rule | chart add: (rule startedAt: chart) ]