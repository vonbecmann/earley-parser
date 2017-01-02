printing
printIntervalOn: aStream
	end
		ifNil: [ 	start shortPrintOn: aStream ]
		ifNotNil: [ 
			aStream nextPut: $[.
			start shortPrintOn: aStream.
			aStream nextPutAll: ', '.
			end shortPrintOn: aStream.
			aStream nextPut: $] ]