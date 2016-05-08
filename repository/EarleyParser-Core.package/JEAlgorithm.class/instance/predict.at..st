private operations
predict: nonterminal at: chart
	"
	Prediction:
		For every state in S(k) of the form (X -> a * Y b, j),
		add (Y -> * y, k) to S(k)
 	 		for every production in the grammar with Y on the left-hand side (Y -> y).
		
	i.e. add all respective predicted items for the given collection of dotted rules
	"

	(grammar alternativesOf: nonterminal) do: [ :dottedRule | chart add: (dottedRule startedAt: chart) ]