testing
isAmbiguous
	^ nodes anySatisfy: [ :each | (self backwardStarOf: each) size > 1 ]