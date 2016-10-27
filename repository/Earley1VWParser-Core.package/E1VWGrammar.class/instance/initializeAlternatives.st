initialization
initializeAlternatives
	(nonterminals sorted: nonterminalSort)
		do: [ :nonterminal | 
			(rules at: nonterminal)
				withIndexDo:
					[ :each :index | 
						alternatives 
							at: (JEOrderedPair first: nonterminal second: index) 
							put: each ] ]