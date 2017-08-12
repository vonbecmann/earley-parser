public
acceptsUBDA
	" 
| date        | time to run    |
| 11 May 2016 | 0:00:00:04.974 |
| 13 May 2016 | 0:00:00:04.386 |
| 18 May 2016 | 0:00:00:09.899 |
| 19 May 2016 | 0:00:00:08.169 |
| 20 May 2016 | 0:00:00:09.961 |
| 21 May 2016 | 0:00:00:05.724 |
| 22 May 2016 | 0:00:00:04.44  |
| 24 May 2016 | 0:00:00:07.386 |
| 31 May 2016 | 0:00:00:07.201 |
| 5 June 2016 | 0:00:00:07.412 |
| 1 September 2016 | 0:00:00:07.009 |
| 12 September 2016 | 0:00:00:06.381 |
| 15 September 2016 | 0:00:00:03.882 |
| 22 September 2016 | 0:00:00:02.815 |
| 21 October 2016 | 0:00:00:02.718 |
| 12 August 2017 | 0:00:00:02.756 |
	"

	| n words grammar |
	n := 400.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar accepts: words ] timeToRun