instance creation
BK
	"has unbounded ambiguity, yet it is a time n grammar. page 39."
	^ [ | K J F I x |
		K := JENonterminal named: 'K'.
		J := JENonterminal named: 'J'.
		F := JENonterminal named: 'F'.
		I := JENonterminal named: 'I'.
		x := JETerminal character: $x.
		JEGrammar
			basedOn:
			{	K is_epsilon.		
				K is: K, J.
				J is: F.
				J is: I.
				F is: x.
				I is: x. } ] value