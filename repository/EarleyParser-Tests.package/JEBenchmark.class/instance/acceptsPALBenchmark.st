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
| 24 May 2016 | 0:00:00:03.9   |
| 31 May 2016 | 0:00:00:05.482 |
| 5 June 2016 | 0:00:00:04.195 |
| 1 September 2016 | 0:00:00:03.86 |
| 12 September 2016 | 0:00:00:03.276 |
	"

	| n words grammar maxOdd |
	n := 1500.
	maxOdd := (n to: 1 by: -1) detect: [ :each | each odd ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar accepts: words ] timeToRun