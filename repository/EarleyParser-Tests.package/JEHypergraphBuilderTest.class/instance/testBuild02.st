running
testBuild02
	"build a graph twice"

	| newGraph |
	builder gatherTargetNode: 'S @ [1, 2]'.
	builder gatherSourceNode: 'A @ [1, 2]'.
	builder addEdgeLabeled: 'S is A'.

	graph := builder build.
	self assert: graph nodesSize equals: 2.
	self assert: graph edgesSize equals: 1.

	newGraph := builder build.
	self assert: newGraph isEmpty