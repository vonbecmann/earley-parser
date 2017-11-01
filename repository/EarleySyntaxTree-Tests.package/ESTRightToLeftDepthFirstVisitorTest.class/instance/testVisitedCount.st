tests
testVisitedCount
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	parseTree := grammar parseTree: '101010001101'.

	ESTRightToLeftDepthFirstVisitor new
		preOrderBlock: [ firstCount := firstCount + 1 ];
		postOrderBlock: [ secondCount := secondCount + 1 ];
		visit: parseTree.
		
	self assert: firstCount equals: secondCount