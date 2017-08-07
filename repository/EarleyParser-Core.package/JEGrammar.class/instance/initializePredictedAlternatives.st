initialization
initializePredictedAlternatives
	rules
		keysAndValuesDo:
			[ :nonterminal :alternative | 
				predictedAlternatives at: nonterminal put: alternative dotAtBeginning ]