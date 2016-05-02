testing
isAmbiguous
	^ syntaxTree nodes anySatisfy: [ :each | (syntaxTree backwardStarOf: each) size > 1 ]