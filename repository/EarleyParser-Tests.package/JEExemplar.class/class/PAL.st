instance creation
PAL
	"pallindrome grammar. page 65"
	^ [	| A x |
		A := JENonterminal named: 'A'.
		x := JETerminal character: $x.
		JEGrammar
			basedOn:
			{	A is: x.
				A is: x, A, x } ] value