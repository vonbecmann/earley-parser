initialization
initializePredictedAlternatives
	rules
		keysAndValuesDo:
			[ :nonterminal :alternativeRules | 
				predictedAlternatives 
					at: nonterminal 
					putAll: (alternativeRules collect: [ :rule | rule dotAtBeginning ]) ]