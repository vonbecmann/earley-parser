tests
testVisitedFamilyCount04
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxxx'.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ firstCount := firstCount + 1 ];
		postOrderFamilyBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount