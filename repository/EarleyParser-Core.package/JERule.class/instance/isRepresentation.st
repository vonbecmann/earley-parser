testing
isRepresentation
	"am i a representation rule?"

	^ self body size = 1 and: [ (self body at: 1) isTerminal ]