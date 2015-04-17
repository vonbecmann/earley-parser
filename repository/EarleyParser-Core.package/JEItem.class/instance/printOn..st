printing
printOn: aStream
	"[ dotted rule @ start chart number ]"

	"[ dotted rule @  [start chart number, end chart number ] ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream
		space;
		nextPut: $@;
		space.
	endChart isNil
		ifTrue: [ startChart shortPrintOn: aStream ]
		ifFalse: [ 
			aStream nextPut: $[.
			startChart shortPrintOn: aStream.
			aStream
				space;
				nextPut: $,.
			endChart shortPrintOn: aStream.
			aStream nextPut: $] ].
	aStream nextPut: $]