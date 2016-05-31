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
| 22 May 2016 | 0:00:00:00.417 |
| 24 May 2016 | 0:00:00:01.313 |
| 31 May 2016 | 0:00:00:00.815 |
	"

	| n words grammar maxOdd |
	n := 400.
	maxOdd := (n to: 1 by: -1) detect: [ :each | each odd ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar parse: words ] timeToRun