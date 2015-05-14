running
testAddEdge
	| S A first second target source graph |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	first := JEChart number: 1.
	second := JEChart number: 2.
	target := (S body: {A}) dotAtEnd startedAt: first andEndedAt: second.
	source := (A body: {A}) dotAtEnd startedAt: first andEndedAt: second.
	builder gatherTargetNode: target.
	builder gatherSourceNode: target.
	builder gatherSourceNode: source.
	builder addEdge.
	graph := builder build.
	self assert: graph nodesSize equals: 2.
	self assert: graph edgesSize equals: 1