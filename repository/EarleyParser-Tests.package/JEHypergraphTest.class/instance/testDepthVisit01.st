tests
testDepthVisit01
	| visitCount action |
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'C';
		gatherSourceNode: 'D';
		addEdgeLabeled: 'B'.
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'F';
		gatherSourceNode: 'G';
		addEdgeLabeled: 'E'.
	builder
		gatherTargetNode: 'D';
		gatherSourceNode: 'F';
		gatherSourceNode: 'I';
		addEdgeLabeled: 'H'.
	treegraph := builder build treeRootedAt: 'A'.
	visitCount := Dictionary new.
	treegraph nodes do: [ :node | visitCount at: node put: 0 ].
	treegraph edges do: [ :edge | visitCount at: edge put: 0 ].
	action := [ :elem | visitCount at: elem put: (visitCount at: elem) + 1 ].
	treegraph
		depthVisitFrom: treegraph root
		preNode: action
		postNode: action
		preEdge: action
		postEdge: action.
	self assert: (visitCount allSatisfy: [ :each | each value = 2 ]) description: 'All elements should be visited twice'