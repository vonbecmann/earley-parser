private operations
predictNonterminal: nonterminal at: column
	addCount := addCount + (grammar alternativesOf: nonterminal) size.
	predictCount := predictCount + 1.
	super predictNonterminal: nonterminal at: column