private operations
predictNonterminal: nonterminal at: chart
	" add all respective predicted items for the given collection of dotted rules "
	" OPTIMIZED for efficiency. uses do: rather than collect: "

	(grammar alternativesOf: nonterminal)
		do: [ :dottedRule | chart add: (dottedRule startedAt: chart) ]