"
hold a simple benchmark.
| duration |
Smalltalk 
	garbageCollect;
	garbageCollectMost.
duration := JEBenchmark new acceptsBK.
'| ', Date today asString, ' | ', duration asString, ' |'.

"
Class {
	#name : #JEBenchmark,
	#superclass : #Object,
	#category : 'EarleyParser-Tests-Stats'
}

{ #category : #public }
JEBenchmark >> acceptsBK [
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
| 22 September 2016 | 0:00:00:00.047 |
| 21 October 2016   | 0:00:00:00.037 |
| 12 August 2017    | 0:00:00:00.041 |
	"

	| n words grammar |
	n := 1500.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar BK.
	^ [ grammar accepts: words ] timeToRun
]

{ #category : #public }
JEBenchmark >> acceptsPAL [
	"
| date        | time to run    |
| 11 May 2016 | 0:00:00:05.916 |
| 13 May 2016 | 0:00:00:03.747 | 
| 18 May 2016 | 0:00:00:06.052 |
| 19 May 2016 | 0:00:00:06.345 |
| 20 May 2016 | 0:00:00:09.169 |
| 21 May 2016 | 0:00:00:04.958 |
| 22 May 2016 | 0:00:00:03.475 |
| 24 May 2016 | 0:00:00:03.9   |
| 31 May 2016 | 0:00:00:05.482 |
| 5 June 2016 | 0:00:00:04.195 |
| 1 September 2016 | 0:00:00:03.86 |
| 12 September 2016 | 0:00:00:03.276 |
| 15 September 2016 | 0:00:00:03.103 |
| 22 September 2016 | 0:00:00:03.024 |
| 21 October 2016 | 0:00:00:02.565 |
| 12 August 2017 | 0:00:00:02.621 |
	"

	| n words grammar maxOdd |
	n := 1500.
	maxOdd := (n to: 1 by: -1) detect: [ :each | each odd ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar accepts: words ] timeToRun
]

{ #category : #public }
JEBenchmark >> acceptsRR [
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
]

{ #category : #public }
JEBenchmark >> acceptsUBDA [
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
]

{ #category : #public }
JEBenchmark >> parseBK [
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
]

{ #category : #public }
JEBenchmark >> parsePAL [
	"
| date        | time to run    |
| 8 June 2016 | 0:00:00:00.356 |
| 1 September 2016 | 0:00:00:00.33 |
| 12 September 2016 | 0:00:00:00.297 |
| 15 September 2016 | 0:00:00:00.296 |
| 22 September 2016 | 0:00:00:00.288 |
| 21 October 2016 | 0:00:00:00.337 |
| 12 August 2017 | 0:00:00:00.363 |
	"

	| n words grammar maxOdd |
	n := 400.
	maxOdd := (n to: 1 by: -1) detect: [ :each | each odd ].
	words := String new: maxOdd.
	words from: 1 to: maxOdd put: $x.
	grammar := JEExemplar PAL.
	^ [ grammar parse: words ] timeToRun
]

{ #category : #public }
JEBenchmark >> parseRR [
	" 
| date        | time to run    |
| 21 October 2016 | 0:00:00:15.372 |
| 21 October 2016 | 0:00:00:15.401 |
| 12 August 2017 | 0:00:00:15.644 |
	"

	| n words grammar |
	n := 2000.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar RR.
	^ [ grammar parse: words ] timeToRun
]

{ #category : #public }
JEBenchmark >> parseUBDA [
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
]

{ #category : #public }
JEBenchmark >> parseUBDA02 [
	"
| date        | time to run    |
| 8 June 2016 | 0:00:00:05.991 |
| 1 September 2016 | 0:00:00:03.996 |
| 12 September 2016 | 0:00:00:03.98 |
| 15 September 2016 | 0:00:00:03.585 |
| 22 September 2016 | 0:00:00:03.309 |
| 21 October 2016 | 0:00:00:06.728 |
| 12 August 2017 | 0:00:00:05.482 |
	"

	| n words grammar |
	n := 200.
	words := String new: n.
	words from: 1 to: n put: $x.
	grammar := JEExemplar UBDA.
	^ [ grammar parse: words ] timeToRun
]
