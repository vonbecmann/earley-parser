public
ubdaBenchmark
	| n words grammar |
	n := 100.
	words := Array new: n.
	words from: 1 to: n put: #x.
	grammar := JEGrammar
		on:
	{
	(JENonterminal for: #A) body: {(JETerminal for: #x)}.
	(JENonterminal for: #A)	body:	{(JENonterminal for: #A). (JENonterminal for: #A)}
	}.
	grammar accepts: words