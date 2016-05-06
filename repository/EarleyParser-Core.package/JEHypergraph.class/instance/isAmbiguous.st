testing
isAmbiguous
	^ nodes anySatisfy: [ :each | (self indegreeOf: each) > 1 ]