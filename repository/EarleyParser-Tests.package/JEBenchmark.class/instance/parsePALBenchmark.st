public
parsePALBenchmark
	"
| date        | time to run    |
| 8 June 2016 | 0:00:00:00.356 |
| 1 September 2016 | 0:00:00:00.33 |
	"

	| n words grammar maxOdd |
	n := 400.
	maxOdd := (n to: 1 by: -1) detect: [ :each | each odd ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar parse: words ] timeToRun