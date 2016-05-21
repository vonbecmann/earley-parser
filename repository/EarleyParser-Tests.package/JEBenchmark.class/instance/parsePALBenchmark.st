public
parsePALBenchmark
	"
| date        | time to run    |
| 12 May 2016 | 0:00:00:06.561 |
| 13 May 2016 | 0:00:00:05.963 |
| 18 May 2016 | 0:00:00:04.037 |
| 19 May 2016 | 0:00:00:05.931 |
| 20 May 2016 | 0:00:00:00.478 |
| 21 May 2016 | 0:00:00:00.73  |
	"

	| n words grammar maxOdd |
	n := 400.
	maxOdd := ((1 to: n) select: [ :each | each odd ]) detectMax: [ :each | each ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar parse: words ] timeToRun