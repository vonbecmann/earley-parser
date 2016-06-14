instance creation
given: aTree of: aJEGrammar
	"given a syntax tree of a grammar"

	^ self basicNew initializeTree: aTree andGrammar: aJEGrammar