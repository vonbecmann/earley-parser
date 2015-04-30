public
ubdaBenchmark
	| n words grammar |
	n := 400.
	words := Array new: n.
	words from: 1 to: n put: #x.
	grammar := JEExemplar UBDA.
	grammar accepts: words