public
palBenchmark
	| n words grammar maxOdd |
	n := 1000.
	maxOdd := ((1 to: n) select: [ :each | each odd ]) detectMax: [ :each | each ].
	words := Array new: maxOdd.
	words from: 1 to: maxOdd put: #x.
	grammar := JEGrammar
		on:
{
(JENonterminal for: #A) body: {(JETerminal for: #x)}.
(JENonterminal for: #A) body: {(JETerminal for: #x).(JENonterminal for: #A).(JETerminal for: #x)}.
}.
	grammar accepts: words