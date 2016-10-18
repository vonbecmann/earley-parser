instance creation
UBDA
	"unbounded direct ambiguity. page 42.
	 It has unbounded direct ambiguity and no saving grace"

	^ E1VWGrammar
		productionRules: #(#(A #(A A)))
		representations: {(#A -> (JETerminal character: $x))}