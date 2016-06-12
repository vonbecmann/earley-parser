*EarleySyntaxTree
parseTree: words
	"returns a syntax tree"

	^ (ESyntaxTreeParser given: self) parse: words