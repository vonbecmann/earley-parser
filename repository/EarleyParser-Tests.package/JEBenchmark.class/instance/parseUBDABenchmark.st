public
parseUBDABenchmark
	| n words grammar |
	n := 100.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ grammar parse: words