running
setUp
	| builder A x firstRule secondRule first second third fourth |
	builder := JEHypergraphBuilder new.
	start := JENonterminal named: 'Start'.
	A := JENonterminal named: 'A'.
	x := JETerminal symbol: #x.
	firstRule := A body: {x}.
	secondRule := A body:	{ A. A}.
	first := JEChart number: 1.
	second := JEChart number: 2.
	third := JEChart number: 3.
	fourth := JEChart number: 4.
	builder
		gatherTargetNodeLabeled: start from: first to: fourth;
		gatherSourceNodeLabeled: A from: first to: fourth;
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: first to: fourth;
		gatherSourceNodeLabeled: (secondRule dotAt: 2) from: first to: second;
		gatherSourceNodeLabeled: A from: second to: fourth;
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: first to: fourth;
		gatherSourceNodeLabeled: (secondRule dotAt: 2) from: first to: third;
		gatherSourceNodeLabeled: A from: third to: fourth;
		addEdge.
	builder
		gatherTargetNodeLabeled: (secondRule dotAt: 2) from: first to: third;
		gatherSourceNodeLabeled: A from: first to: third;
		addEdge.
	builder
		gatherTargetNodeLabeled: A from: first to: third;
		gatherSourceNodeLabeled: (secondRule dotAt: 2) from: first to: second;
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