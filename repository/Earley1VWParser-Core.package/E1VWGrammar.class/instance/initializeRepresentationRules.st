initialization
initializeRepresentationRules
	representationRules := (rules
		select: [ :each | each body size = 1 and: [ (each body at: 1) isTerminal ] ]) values