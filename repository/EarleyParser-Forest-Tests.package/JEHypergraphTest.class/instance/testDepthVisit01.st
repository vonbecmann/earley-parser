tests
testDepthVisit01
	| visitCount action |
	builder addEdgeSourceNodes: {'C'. 'D'} targetNode: 'A'.
	builder addEdgeSourceNodes: {'F'. 'G'} targetNode: 'A'.
	builder addEdgeSourceNodes: {'F'. 'I'} targetNode: 'D'.
	tree := builder
		rootNode: 'A';
		build.
	visitCount := Dictionary new.
	tree nodes do: [ :node | visitCount at: node put: 0 ].
	tree edges do: [ :edge | visitCount at: edge put: 0 ].
	action := [ :elem | visitCount at: elem put: (visitCount at: elem) + 1 ].
	tree
		depthVisitPreNode: action
		postNode: action
		preEdge: action
		postEdge: action.
	self
		assert: (visitCount allSatisfy: [ :each | each value = 2 ])
		description: 'All elements should be visited twice'