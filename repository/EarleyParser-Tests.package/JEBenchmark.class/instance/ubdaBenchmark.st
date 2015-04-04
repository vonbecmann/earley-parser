public
ubdaBenchmark
	| n words grammar A x|
	n := 400.
	words := Array new: n.
	words from: 1 to: n put: #x.
	A := JENonterminal named: #A.
	x := JETerminal for: #x.
	grammar := JEGrammar
		on:
{
A body: { x }.
A body: { A. A }
}.
	grammar accepts: words