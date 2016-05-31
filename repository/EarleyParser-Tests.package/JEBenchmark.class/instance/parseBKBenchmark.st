public
parseBKBenchmark
	" 
| date        | time to run    |
| 17 May 2016 | 0:00:00:02.043 |
| 19 May 2016 | 0:00:00:02.713 |
| 20 May 2016 | 0:00:00:00.824 |
| 21 May 2016 | 0:00:00:27.961 |
| 22 May 2016 | 0:00:00:01.226 |
| 24 May 2016 | 0:00:00:01.207 |
| 31 May 2016 | 0:00:00:01.125 |
	"

	| n words grammar |
	n := 10000.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar BK.
	^ [ grammar parse: words ] timeToRun