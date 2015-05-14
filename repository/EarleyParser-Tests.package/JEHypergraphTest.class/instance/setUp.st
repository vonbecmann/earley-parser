running
setUp
	| builder startRule firstRule secondRule first second third fourth thirdRule |
	builder := JEHypergraphBuilder new.
	start := JENonterminal named: 'START'.
	A := JENonterminal named: 'A'.
	x := JETerminal character: $x.
	startRule := (start body: {A}) dotAtEnd.
	firstRule := (A body: {x}) dotAtEnd.
	secondRule := (A body: {A. A}) dotAtEnd.
	thirdRule := (A body: {A. A}) dotAt: 2.
	first := JEChart number: 1.
	second := JEChart number: 2.
	third := JEChart number: 3.
	fourth := JEChart number: 4.
	builder
		gatherTargetNode: (startRule startedAt: first andEndedAt: fourth);
		gatherSourceNode: (secondRule startedAt: first andEndedAt: fourth);
		addEdge.
	builder
		gatherTargetNode: (secondRule startedAt: first andEndedAt: fourth);
		gatherSourceNode: (thirdRule  startedAt: first andEndedAt: second);
		gatherSourceNode: (secondRule startedAt: second andEndedAt: fourth);
		addEdge.
	builder
		gatherTargetNode: (secondRule startedAt: first andEndedAt: fourth);
		gatherSourceNode: (thirdRule startedAt: first andEndedAt: third);
		gatherSourceNode: (firstRule startedAt: third andEndedAt: fourth);
		addEdge.
	builder
		gatherTargetNode: (thirdRule startedAt: first andEndedAt: third);
		gatherSourceNode: (firstRule startedAt: first andEndedAt: third);
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: first to: third;
		gatherSourceNodeLabeled: (thirdRule) from: first to: second;
		gatherSourceNodeLabeled: A from: second to: third;
		addEdge.
	builder
		gatherTargetNodeLabeled: (secondRule dotAt: 2) from: first to: second;
		gatherSourceNodeLabeled: A from: first to: second;
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: first to: second;
		gatherSourceNodeLabeled: x from: first to: second;
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: second to: third;
		gatherSourceNodeLabeled: x from: second to: third;
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: third to: fourth;
		gatherSourceNodeLabeled: x from: third to: fourth;
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: second to: fourth;
		gatherSourceNodeLabeled: (secondRule dotAt: 2) from: second to: third;
		gatherSourceNodeLabeled: A from: third to: fourth;
		addEdge.
	builder
		gatherTargetNodeLabeled: (secondRule dotAt: 2) from: second to: third;
		gatherSourceNodeLabeled: A from: second to: third;
		addEdge.
	graph := builder build