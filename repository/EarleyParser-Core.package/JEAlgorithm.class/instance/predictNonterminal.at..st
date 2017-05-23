private operations
predictNonterminal: nonterminal at: column
	" add all respective predicted items for the given collection of dotted rules "
	" OPTIMIZED for efficiency. uses do: rather than collect: "

	(grammar alternativesOf: nonterminal)
		do: [ :dottedRule | column add: (dottedRule startedAt: column) ]