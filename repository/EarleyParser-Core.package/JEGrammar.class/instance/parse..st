public
parse: words
	"returns a parse forest"
	"returns a Binary Shared Packed Parse Forest"

	^ (JEForestParser given: self) parse: words