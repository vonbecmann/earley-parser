public
parseBK
	" 
| date        | time to run    |
| 8 June 2016 | 0:00:00:00.516 |
| 1 September 2016 | 0:00:00:00.855 |
| 12 September 2016 | 0:00:00:00.81 |
| 15 September 2016 | 0:00:00:00.906 |
| 22 September 2016 | 0:00:00:00.86 |
| 21 October 2016 | 0:00:00:01.052 |
| 12 August 2017 | 0:00:00:00.791 |
	"

	| n words grammar |
	n := 10000.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar BK.
	^ [ grammar parse: words ] timeToRun