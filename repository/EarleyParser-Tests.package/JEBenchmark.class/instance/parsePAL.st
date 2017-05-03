public
parsePAL
	"
| date        | time to run    |
| 8 June 2016 | 0:00:00:00.356 |
| 1 September 2016 | 0:00:00:00.33 |
| 12 September 2016 | 0:00:00:00.297 |
| 15 September 2016 | 0:00:00:00.296 |
| 22 September 2016 | 0:00:00:00.288 |
| 21 October 2016 | 0:00:00:00.337 |
	"

	| n words grammar maxOdd |
	n := 400.
	maxOdd := (n to: 1 by: -1) detect: [ :each | each odd ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar parse: words ] timeToRun