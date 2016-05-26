testing
isAmbiguous
	^ nodes anySatisfy: [ :each | (backwardStar at: each) size > 1 ]