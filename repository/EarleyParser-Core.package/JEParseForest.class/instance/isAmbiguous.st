testing
isAmbiguous
	^ syntaxTree nodes anySatisfy: [ :each | (syntaxTree indegreeOf: each) > 1 ]