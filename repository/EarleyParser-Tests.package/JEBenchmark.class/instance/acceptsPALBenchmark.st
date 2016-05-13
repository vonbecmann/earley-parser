public
acceptsPALBenchmark
	"
| date        | time to run    |
| 11 May 2016 | 0:00:00:05.916 |
| 13 May 2016 | 0:00:00:03.747 | 
	"

	| n words grammar maxOdd |
	n := 1500.
	maxOdd := ((1 to: n) select: [ :each | each odd ]) detectMax: [ :each | each ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar accepts: words ] timeToRun