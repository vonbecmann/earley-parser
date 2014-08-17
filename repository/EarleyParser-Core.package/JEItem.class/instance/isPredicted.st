testing
isPredicted
	^ self isFinal not and: [ self symbolAtDot isNonTerminal ]