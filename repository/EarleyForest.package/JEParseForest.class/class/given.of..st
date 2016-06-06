instance creation
given: aSyntaxTree of: aJEGrammar
	"given a syntax tree of a grammar"

	^ self basicNew initializeSyntaxTree: aSyntaxTree andGrammar: aJEGrammar