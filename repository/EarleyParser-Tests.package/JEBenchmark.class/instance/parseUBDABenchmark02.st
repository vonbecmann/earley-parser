public
parseUBDABenchmark02
	"
| date        | time to run    |
| 26 May 2016 | 0:00:00:09.035 |
	"

	| n words grammar |
	n := 200.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parse: words ] timeToRun