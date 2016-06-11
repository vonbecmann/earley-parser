printing
printChartOn: aStream
	endChart
		ifNil: [ 	startChart shortPrintOn: aStream ]
		ifNotNil: [ 
			aStream nextPut: $[.
			startChart shortPrintOn: aStream.
			aStream nextPutAll: ', '.
			endChart shortPrintOn: aStream.
			aStream nextPut: $] ]