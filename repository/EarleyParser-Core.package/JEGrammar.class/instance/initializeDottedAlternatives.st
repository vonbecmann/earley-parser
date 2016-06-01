initialization
initializeDottedAlternatives
	nonterminals
		do: [ :nonterminal | 
			dottedAlternatives
				at: nonterminal
				putAll:
					(rules
						select: [ :rule | rule head = nonterminal ]
						thenCollect: [ :rule | rule dotAtBeginning ]) ]