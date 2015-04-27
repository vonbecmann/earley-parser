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
		gatherNodeLabeled: start from: first to: fourth;
		gatherNodeLabeled: A from: first to: fourth;
		addEdge.
	builder
		gatherNodeLabeled: A from: first to: fourth;
		gatherNodeLabeled: (secondRule dotAt: 2) from: first to: second;
		gatherNodeLabeled: A from: second to: fourth;
		addEdge.
	builder
		gatherNodeLabeled: A from: first to: fourth;
		gatherNodeLabeled: (secondRule dotAt: 2) from: first to: third;
		gatherNodeLabeled: A from: third to: fourth;
		addEdge.
	builder
		gatherNodeLabeled: (secondRule dotAt: 2) from: first to: third;
		gatherNodeLabeled: A from: first to: third;
		addEdge.
	builder
		gatherNodeLabeled: A from: first to: third;
		gatherNodeLabeled: (secondRule dotAt: 2) from: first to: second;
		gatherNodeLabeled: A from: second to: third;
		addEdge.
	builder
		gatherNodeLabeled: (secondRule dotAt: 2) from: first to: second;
		gatherNodeLabeled: A from: first to: second;
		addEdge.
	builder
		gatherNodeLabeled: A from: first to: second;
		gatherNodeLabeled: x from: first to: second;
		addEdge.
	builder
		gatherNodeLabeled: A from: second to: third;
		gatherNodeLabeled: x from: second to: third;
		addEdge.		
	builder
		gatherNodeLabeled: A from: third to: fourth;
		gatherNodeLabeled: x from: third to: fourth;
		addEdge.	
	builder
		gatherNodeLabeled: A from: second to: fourth;	
		gatherNodeLabeled: (secondRule dotAt: 2) from: second to: third;
		gatherNodeLabeled: A from: third to: fourth;
		addEdge.
	builder
		gatherNodeLabeled: (secondRule dotAt: 2) from: second to: third;
		gatherNodeLabeled: A from: second to: third;
		addEdge.							
	graph := builder build