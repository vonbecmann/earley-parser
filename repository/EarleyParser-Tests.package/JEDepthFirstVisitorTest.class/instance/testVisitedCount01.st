tests
testVisitedCount01
	| firstNodeCount secondNodeCount firstFamilyCount secondFamilyCount |
	firstNodeCount := 0.
	secondNodeCount := 0.
	firstFamilyCount := 0.
	secondFamilyCount := 0.
	forest := parser parse: 'xxxxx'.

	JEDepthFirstVisitor new
		preOrderNodeBlock: [ firstNodeCount := firstNodeCount + 1 ];
		postOrderNodeBlock: [ secondNodeCount := secondNodeCount + 1 ];
		preOrderFamilyBlock: [ firstFamilyCount := firstFamilyCount + 1 ];
		postOrderFamilyBlock: [ secondFamilyCount := secondFamilyCount + 1 ];
		visit: forest.

	self assert: firstNodeCount equals: secondNodeCount.
	self assert: firstFamilyCount equals: secondFamilyCount 
	