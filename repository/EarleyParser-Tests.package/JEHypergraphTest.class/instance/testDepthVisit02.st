tests
testDepthVisit02
	| visitCount action |
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'C';
		gatherSourceNode: 'D';
		addEdge.
	builder
		gatherTargetNode: 'C';
		gatherSourceNode: 'F';
		gatherSourceNode: 'G';
		addEdge.
	builder
		gatherTargetNode: 'G';
		gatherSourceNode: 'I';
		gatherSourceNode: 'J';
		addEdge.
	builder
		gatherTargetNode: 'J';
		gatherSourceNode: 'L';
		gatherSourceNode: 'C';
		addEdge.
	tree := builder
		rootNode: 'A';
		build.
	visitCount := Dictionary new.
	tree nodes do: [ :node | visitCount at: node put: 0 ].
	tree edges do: [ :edge | visitCount at: edge put: 0 ].
	action := [ :elem | visitCount at: elem put: (visitCount at: elem) + 1 ].
	tree
		depthVisitFrom: tree root
		preNode: action
		postNode: action
		preEdge: action
		postEdge: action.
	self
		assert: (visitCount allSatisfy: [ :each | each value = 2 ])
		description: 'All elements should be visited twice'