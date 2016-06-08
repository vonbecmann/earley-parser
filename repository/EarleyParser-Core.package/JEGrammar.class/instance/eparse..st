public
eparse: words
	"returns parsing information"

	^ (JEParser given: self) parse: words