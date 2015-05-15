public
acceptsUBDABenchmark
	| n words grammar |
	n := 60.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	grammar accepts: words