running
setUp
	| A x |
	A := JENonterminal named: #A.
	x := JETerminal for: #x.
	grammar := JEGrammar
		on:
{
A body: { x }.
A body: { A. A }
}