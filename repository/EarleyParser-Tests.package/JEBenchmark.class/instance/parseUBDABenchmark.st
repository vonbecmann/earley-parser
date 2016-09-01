public
parseUBDABenchmark
	"
| date        | time to run    |
| 8 June 2016 | 0:00:00:00.587 |
| 1 September 2016 | 0:00:00:00.429 |
	"

	| n words grammar |
	n := 100.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parse: words ] timeToRun