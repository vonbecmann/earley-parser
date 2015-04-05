printing
printOn: aStream
	"[ dotted rule @ start chart number ]"

	"[ dotted rule @  [start chart number, chart number ] ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream
		space;
		nextPut: $@;
		space.
	chart isNil
		ifTrue: [ startChart shortPrintOn: aStream ]
		ifFalse: [ 
			aStream nextPut: $[.
			startChart shortPrintOn: aStream.
			aStream
				space;
				nextPut: $,.
			chart shortPrintOn: aStream.
			aStream nextPut: $] ].
	aStream nextPut: $]