public
parseUBDABenchmark02
	"
| date        | time to run    |
| 8 June 2016 | 0:00:00:05.991 |
| 1 September 2016 | 0:00:00:03.996 |
| 12 September 2016 | 0:00:00:03.98 |
| 15 September 2016 | 0:00:00:03.585 |
	"

	| n words grammar |
	n := 200.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parse: words ] timeToRun