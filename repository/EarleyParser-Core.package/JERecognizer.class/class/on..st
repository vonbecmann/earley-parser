instance creation
on: aGrammarSpec
	^ self basicNew initializeGrammar: (JEGrammarParser parse: aGrammarSpec)