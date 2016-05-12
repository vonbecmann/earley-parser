testing
isAmbiguous
	^ nodes anySatisfy: [ :each | each indegree > 1 ]