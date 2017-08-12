public
acceptsRR
	" 
| date        | time to run    |
| 18 October 2016 | 0:00:00:05.493 |
| 21 October 2016 | 0:00:00:05.341 |
| 12 August 2017  | 0:00:00:04.253 |
	"

	| n words grammar |
	n := 2000.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar RR.
	^ [ grammar accepts: words ] timeToRun