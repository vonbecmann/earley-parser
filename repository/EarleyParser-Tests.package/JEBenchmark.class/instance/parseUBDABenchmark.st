public
parseUBDABenchmark
	"
| date        | time to run    |
| 12 May 2016 | 0:00:00:06.49  |
	"

	| n words grammar |
	n := 100.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parse: words ] timeToRun