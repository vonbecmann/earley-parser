public
parse: words
	"returns a Binary Shared Packed Parse Forest"

	^ (E1VWBSPPFParser given: self) parse: words