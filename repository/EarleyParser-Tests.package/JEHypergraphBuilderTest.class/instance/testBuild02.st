running
testBuild02
	"build a graph twice"

	| S A target source graph newGraph |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	target := JEConstituent value: S start: 1 end: 2.
	source := JEConstituent value: A start: 1 end: 2.
	builder gatherTargetNode: target.
	builder gatherSourceNode: source.
	builder addEdgeLabeled: (S body: {A}).
	graph := builder build.
	self assert: graph nodesSize equals: 2.
	self assert: graph edgesSize equals: 1.
	newGraph := builder build.
	self assert: newGraph isEmpty