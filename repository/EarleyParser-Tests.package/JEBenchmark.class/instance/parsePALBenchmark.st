public
parsePALBenchmark
	| n words grammar maxOdd |
	n := 200.
	maxOdd := ((1 to: n) select: [ :each | each odd ]) detectMax: [ :each | each ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ grammar parse: words