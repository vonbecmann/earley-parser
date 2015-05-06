instance creation
RR
	"RR is LR(1), but there is not bound on the size of charts, so it is not BS(1). page 48"
	
	^ [| A x |
		A := JENonterminal named: 'A'.
		x := JETerminal symbol: #x.
		JEGrammar
			basedOn:
			{	A body: { x }.
				A body: { x. A. } } ] value