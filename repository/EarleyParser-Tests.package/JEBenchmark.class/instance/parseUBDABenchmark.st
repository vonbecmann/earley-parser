public
parseUBDABenchmark
	"
| date        | time to run    |
| 12 May 2016 | 0:00:00:06.49  |
| 13 May 2016 | 0:00:00:04.279 |
| 18 May 2016 | 0:00:00:02.817 |
| 19 May 2016 | 0:00:00:02.662 |
| 20 May 2016 | 0:00:00:00.931 |
| 21 May 2016 | 0:00:00:01.182 |
| 22 May 2016 | 0:00:00:00.867 |
| 24 May 2016 | 0:00:00:00.939 |
| 31 May 2016 | 0:00:00:01.697 |
| 5 June 2016 | 0:00:00:02.151 |
	"

	| n words grammar |
	n := 100.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parse: words ] timeToRun