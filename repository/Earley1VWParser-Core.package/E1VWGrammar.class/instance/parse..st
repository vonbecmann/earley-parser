public
parse: words
	"returns a Binary Shared Packed Parse Forest"

	^ (JEBSPPFParser given: self) parse: words