printing
printChartOn: aStream
	endChart isNil
		ifTrue: [ startChart shortPrintOn: aStream ]
		ifFalse: [ 
			aStream nextPut: $[.
			startChart shortPrintOn: aStream.
			aStream nextPutAll: ', '.
			endChart shortPrintOn: aStream.
			aStream nextPut: $] ]