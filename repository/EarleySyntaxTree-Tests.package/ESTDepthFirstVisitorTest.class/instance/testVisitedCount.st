tests
testVisitedCount
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	parseTree := grammar parseTree: '1010100011011'.

	ESTDepthFirstVisitor new
		preOrderBlock: [ firstCount := firstCount + 1 ];
		postOrderBlock: [ secondCount := secondCount + 1 ];
		visit: parseTree.

	self assert: firstCount equals: secondCount