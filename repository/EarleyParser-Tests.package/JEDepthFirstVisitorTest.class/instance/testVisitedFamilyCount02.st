tests
testVisitedFamilyCount02
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxx'.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ firstCount := firstCount + 1 ];
		postOrderFamilyBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount