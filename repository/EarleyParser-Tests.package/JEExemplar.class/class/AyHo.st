instance creation
AyHo
	"
	Practical Earley Parsing
	John Aycock
	R. Nigel Horspool
	page 2, figure 2
	"

	^ [ | S A E a |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	E := JENonterminal named: 'E'.
	a := JETerminal character: $a.
	JEGrammar
		basedOn:
			{(S is: A , A , A , A).
			(A is: E).
			(A is: a).
			E is_epsilon} ] value