public
parseBKBenchmark
	" 
| date        | time to run    |
| 8 June 2016 | 0:00:00:00.516 |
	"

	| n words grammar |
	n := 10000.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar BK.
	^ [ grammar parse: words ] timeToRun