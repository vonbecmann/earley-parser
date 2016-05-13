public
acceptsUBDABenchmark
	" 
| date        | time to run    |
| 11 May 2016 | 0:00:00:04.974 |
| 13 May 2016 | 0:00:00:04.386 |
	"

	| n words grammar |
	n := 400.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar accepts: words ] timeToRun