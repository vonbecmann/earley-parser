testing
isRepresentation
	"am i a representation rule?"

	^ body size = 1 and: [ (body at: 1) isTerminal ]