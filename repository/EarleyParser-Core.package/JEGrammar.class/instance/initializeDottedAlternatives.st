initialization
initializeDottedAlternatives
	nonterminals
		do: [ :nonterminal | 
			dottedAlternatives
				at: nonterminal
				putAll: ((rules at: nonterminal) collect: [ :rule | rule dotAtBeginning ]) ]