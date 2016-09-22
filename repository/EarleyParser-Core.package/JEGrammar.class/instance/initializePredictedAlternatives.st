initialization
initializePredictedAlternatives
	nonterminals
		do: [ :nonterminal | 
			predictedAlternatives
				at: nonterminal
				putAll: ((rules at: nonterminal) collect: [ :rule | rule dotAtBeginning ]) ]