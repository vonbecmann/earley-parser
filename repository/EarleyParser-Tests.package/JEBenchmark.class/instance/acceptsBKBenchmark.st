public
acceptsBKBenchmark
	" 
| date        | time to run    |
| 17 May 2016 | 0:00:00:00.052 |
| 19 May 2016 | 0:00:00:00.053 |
| 20 May 2016 | 0:00:00:00.064 |
| 21 May 2016 | 0:00:00:00.593 |
	"

	| n words grammar |
	n := 1500.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar BK.
	^ [ grammar accepts: words ] timeToRun