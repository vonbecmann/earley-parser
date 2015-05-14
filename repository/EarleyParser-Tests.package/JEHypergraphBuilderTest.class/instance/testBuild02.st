running
testBuild02
	"build a graph twice"

	| S A first second target source graph newGraph |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	first := JEChart number: 1.
	second := JEChart number: 2.
	target := (S body: {A}) dotAtEnd startedAt: first andEndedAt: second.
	source := (A body: {A}) dotAtEnd startedAt: first andEndedAt: second.
	builder gatherTargetNode: target.
	builder gatherSourceNode: source.
	builder addEdge.
	graph := builder build.
	self assert: graph nodesSize equals: 2.
	self assert: graph edgesSize equals: 1.
	newGraph := builder build.
	self assert: newGraph nodesIsEmpty.
	self assert: newGraph edgesIsEmpty