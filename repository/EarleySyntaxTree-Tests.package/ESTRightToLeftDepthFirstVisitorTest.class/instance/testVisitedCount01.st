tests
testVisitedCount01
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	parseTree := grammar parseTree: '10110001101'.

	ESTRightToLeftDepthFirstVisitor new
		preOrderBlock: [ firstCount := firstCount + 1 ];
		visit: parseTree.

	ESTRightToLeftDepthFirstVisitor new
		postOrderBlock: [ secondCount := secondCount + 1 ];
		visit: parseTree.
		
	self assert: firstCount equals: secondCount