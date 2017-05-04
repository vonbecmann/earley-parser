instance creation
RR
	"RR is LR(1), but there is not bound on the size of charts, so it is not BS(1). page 48"

	^ JEGrammar
		productionRules: #(#('A' #('letter x symbol')) #('A' #('letter x symbol' 'A')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}