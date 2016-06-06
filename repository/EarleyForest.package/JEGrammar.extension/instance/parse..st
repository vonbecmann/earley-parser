*EarleyForest
parse: words
	"returns a parse forest"

	^ (JEForestParser given: self) parse: words