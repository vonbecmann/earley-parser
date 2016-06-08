public
parse: words
	"returns a SPPForest"

	^ (JESPPFParser given: self) parse: words