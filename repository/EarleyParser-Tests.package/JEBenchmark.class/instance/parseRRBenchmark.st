public
parseRRBenchmark
	" 
| date        | time to run    |
| 21 October 2016 | 0:00:00:15.372 |
	"

	| n words grammar |
	n := 2000.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar RR.
	^ [ grammar parse: words ] timeToRun