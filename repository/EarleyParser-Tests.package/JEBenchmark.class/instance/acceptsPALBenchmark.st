public
acceptsPALBenchmark
	"
| date        | time to run    |
| 11 May 2016 | 0:00:00:05.916 |
| 13 May 2016 | 0:00:00:03.747 | 
| 18 May 2016 | 0:00:00:06.052 |
| 19 May 2016 | 0:00:00:06.345 |
| 20 May 2016 | 0:00:00:09.169 |
| 21 May 2016 | 0:00:00:04.958 |
| 22 May 2016 | 0:00:00:03.475 |
	"

	| n words grammar maxOdd |
	n := 1500.
	maxOdd := ((1 to: n) select: [ :each | each odd ]) detectMax: [ :each | each ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar accepts: words ] timeToRun