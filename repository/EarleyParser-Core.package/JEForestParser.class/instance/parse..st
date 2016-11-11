public
parse: words
	"returns a parse forest"

	^ JEParseForest given: (super parse: words) of: grammar