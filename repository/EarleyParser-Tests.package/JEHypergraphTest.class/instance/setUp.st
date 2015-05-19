running
setUp
	| builder A x aThenX aThenAA aThenADotA first second third fourth firstX secondX thirdX |
	builder := JEHypergraphBuilder new.
	A := JENonterminal named: 'A'.
	x := JETerminal character: $x.
	aThenX := (A body: {x}) dotAtEnd.
	aThenAA := (A body: {A.	A}) dotAtEnd.
	aThenADotA := (A body: {A. A}) dotAt: 2.
	first := JEChart number: 1.
	second := JEChart number: 2.
	third := JEChart number: 3.
	fourth := JEChart number: 4.
	startNode := (JENonterminal start body: {A}) dotAtEnd startedAt: first andEndedAt: fourth.
	firstX := (JEToken this: $x matches: x) startedAt: first andEndedAt: second.
	secondX := (JEToken	this: $x	matches: x) startedAt: second andEndedAt: third.
	thirdX := (JEToken this: $x matches: x) startedAt: third andEndedAt: fourth.
	
	builder
		gatherTargetNode: startNode;
		gatherSourceNode: (aThenAA startedAt: first andEndedAt: fourth);
		addEdge.
	builder
		gatherTargetNode: (aThenAA startedAt: first andEndedAt: fourth);
		gatherSourceNode: (aThenADotA startedAt: first andEndedAt: second);
		gatherSourceNode: (aThenAA startedAt: second andEndedAt: fourth);
		addEdge.
	builder
		gatherTargetNode: (aThenAA startedAt: first andEndedAt: fourth);
		gatherSourceNode: (aThenADotA startedAt: first andEndedAt: third);
		gatherSourceNode: (aThenX startedAt: third andEndedAt: fourth);
		addEdge.
	builder
		gatherTargetNode: (aThenADotA startedAt: first andEndedAt: third);
		gatherSourceNode: (aThenAA startedAt: first andEndedAt: third);
		addEdge.
	builder
		gatherTargetNode: (aThenAA startedAt: first andEndedAt: third);
		gatherSourceNode: (aThenADotA startedAt: first andEndedAt: second);
		gatherSourceNode: (aThenX startedAt: second andEndedAt: third);
		addEdge.
	builder
		gatherTargetNode: (aThenADotA startedAt: first andEndedAt: second);
		gatherSourceNode: (aThenX startedAt: first andEndedAt: second);
		addEdge.
	builder
		gatherTargetNode: (aThenX startedAt: first andEndedAt: second);
		gatherSourceNode: firstX;
		addEdge.
	builder
		gatherTargetNode: (aThenX startedAt: second andEndedAt: third);
		gatherSourceNode: secondX;
		addEdge.
	builder
		gatherTargetNode: (aThenX startedAt: third andEndedAt: fourth);
		gatherSourceNode: thirdX;
		addEdge.
	builder
		gatherTargetNode: (aThenAA startedAt: second andEndedAt: fourth);
		gatherSourceNode: (aThenADotA startedAt: second andEndedAt: third);
		gatherSourceNode: (aThenX startedAt: third andEndedAt: fourth);
		addEdge.
	builder
		gatherTargetNode: (aThenADotA startedAt: second andEndedAt: third);
		gatherSourceNode: (aThenX startedAt: second andEndedAt: third);
		addEdge.
	graph := builder build