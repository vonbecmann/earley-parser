public
parseUBDA
	"
| date        | time to run    |
| 8 June 2016 | 0:00:00:00.587 |
| 1 September 2016 | 0:00:00:00.429 |
| 12 September 2016 | 0:00:00:00.427 |
| 15 September 2016 | 0:00:00:00.363 |
| 22 September 2016 | 0:00:00:00.318 |
| 21 October 2016 | 0:00:00:00.499 |
| 12 August 2017 | 0:00:00:00.484 |
	"

	| n words grammar |
	n := 100.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parse: words ] timeToRun