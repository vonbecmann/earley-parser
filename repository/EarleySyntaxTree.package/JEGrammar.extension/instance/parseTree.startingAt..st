*EarleySyntaxTree
parseTree: words startingAt: aNonterminalNamed
	"returns a syntax tree starting at a given nonterminal"

	^ (self startAt: aNonterminalNamed) parseTree: words