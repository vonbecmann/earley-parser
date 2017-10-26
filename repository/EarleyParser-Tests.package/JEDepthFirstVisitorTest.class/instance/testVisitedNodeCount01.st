tests
testVisitedNodeCount01
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxx'.
	JEDepthFirstVisitor new
		preOrderNodeBlock: [ firstCount := firstCount + 1 ];
		visit: forest.
	JEDepthFirstVisitor new
		postOrderNodeBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount