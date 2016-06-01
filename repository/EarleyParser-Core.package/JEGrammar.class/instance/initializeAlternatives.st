initialization
initializeAlternatives
	(nonterminals sorted: nonterminalSort)
		do: [ :nonterminal | 
			((rules select: [ :rule | rule head = nonterminal ]) sorted: ruleSort)
				withIndexDo: [ :each :index | alternatives at: (JEPair first: nonterminal second: index) put: each ] ]