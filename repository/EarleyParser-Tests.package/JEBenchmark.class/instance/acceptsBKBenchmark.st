public
acceptsBKBenchmark
	" 
| date        | time to run    |
| 17 May 2016 | 0:00:00:00.052 |
| 19 May 2016 | 0:00:00:00.053 |
| 20 May 2016 | 0:00:00:00.064 |
| 21 May 2016 | 0:00:00:00.593 |
| 22 May 2016 | 0:00:00:00.561 |
| 24 May 2016 | 0:00:00:00.046 |
| 31 May 2016 | 0:00:00:00.054 |
| 5 June 2016 | 0:00:00:00.044 |
| 1 September 2016 | 0:00:00:00.042 |
| 12 September 2016 | 0:00:00:00.036 |
| 15 September 2016 | 0:00:00:00.045 |
	"

	| n words grammar |
	n := 1500.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar BK.
	^ [ grammar accepts: words ] timeToRun