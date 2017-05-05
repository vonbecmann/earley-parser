instance creation
UBDA
	"unbounded direct ambiguity. page 42.
	 It has unbounded direct ambiguity and no saving grace"

	^ JEGrammar
		productionRules: #(#('A' #('letter x symbol')) #('A' #('A' 'A')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}