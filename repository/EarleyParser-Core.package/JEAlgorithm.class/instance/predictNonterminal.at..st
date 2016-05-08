private operations
predictNonterminal: nonterminal at: chart
	" add all respective predicted items for the given collection of dotted rules "

	(grammar alternativesOf: nonterminal) 
		do: [ :dottedRule | chart add: (dottedRule startedAt: chart) ]