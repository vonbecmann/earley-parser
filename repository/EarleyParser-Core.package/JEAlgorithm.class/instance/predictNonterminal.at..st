private operations
predictNonterminal: nonterminal at: itemSet
	" add all respective predicted items for the given collection of dotted rules "
	" OPTIMIZED for efficiency. uses do: rather than collect: "

	(grammar alternativesOf: nonterminal)
		do: [ :dottedRule | itemSet add: (dottedRule startedAt: itemSet) ]