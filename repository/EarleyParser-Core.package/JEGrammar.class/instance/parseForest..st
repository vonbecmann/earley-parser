public
parseForest: words
	"returns a parse forest"

	^ (JEForestParser given: self) parse: words