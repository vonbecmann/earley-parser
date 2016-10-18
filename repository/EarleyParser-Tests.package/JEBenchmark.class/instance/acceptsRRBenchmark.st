public
acceptsRRBenchmark
	" 
| date        | time to run    |
| 18 October 2016 | 0:00:00:05.493 |

	"

	| n words grammar |
	n := 2000.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar RR.
	^ [ grammar accepts: words ] timeToRun