tests
testDepthVisit03
	| order visitOrder nodeAction edgeAction |
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'C';
		gatherSourceNode: 'D';
		addEdgeLabeled: 'B'.
	builder
		gatherTargetNode: 'C';
		gatherSourceNode: 'J';
		gatherSourceNode: 'K';
		addEdgeLabeled: 'E'.
	builder
		gatherTargetNode: 'D';
		gatherSourceNode: 'F';
		gatherSourceNode: 'I';
		addEdgeLabeled: 'H'.
	treegraph := builder build treeRootedAt: 'A'.
	order := 0.
	visitOrder := Dictionary new.
	treegraph nodes do: [ :node | visitOrder at: node model put: 0 ].
	treegraph edges do: [ :edge | visitOrder at: edge label put: 0 ].
	nodeAction := [ :node | visitOrder at: node model put: (order := order + 1) ].
	edgeAction := [ :edge | visitOrder at: edge label put: (order := order + 1) ].
	treegraph
		depthVisitFrom: treegraph root
		preNode: nodeAction
		postNode: nil
		preEdge: edgeAction
		postEdge: nil.
	self assert: (visitOrder at: 'A') equals: 1.
	self assert: (visitOrder at: 'B') equals: 2.
	self assert: (visitOrder at: 'C') equals: 3.
	self assert: (visitOrder at: 'E') equals: 4.
	self assert: (visitOrder at: 'J') equals: 5.
	self assert: (visitOrder at: 'K') equals: 6.
	self assert: (visitOrder at: 'D') equals: 7.
	self assert: (visitOrder at: 'H') equals: 8.
	self assert: (visitOrder at: 'F') equals: 9.
	self assert: (visitOrder at: 'I') equals: 10