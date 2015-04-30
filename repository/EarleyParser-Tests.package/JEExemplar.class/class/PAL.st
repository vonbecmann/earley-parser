instance creation
PAL
	"pallindrome grammar. page 65"
	^ [	| A x |
		A := JENonterminal named: 'A'.
		x := JETerminal symbol: #x.
		JEGrammar
			basedOn:
			{	A body: { x }.
				A body: { x. A. x} } ] value