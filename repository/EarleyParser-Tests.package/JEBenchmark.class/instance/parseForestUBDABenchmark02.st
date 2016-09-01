parse forest
parseForestUBDABenchmark02
	"
| date        | time to run    |
| 26 May 2016 | 0:00:00:09.035 |
| 31 May 2016 | 0:00:00:15.278 |
| 5 June 2016 | 0:00:00:14.223 |
| 1 September 2016 | 0:00:00:04.642 |
	"

	| n words grammar |
	n := 200.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parseForest: words ] timeToRun