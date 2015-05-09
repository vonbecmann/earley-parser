private
descriptionPrintOn: aStream
	aStream nextPutAll: 'regex('.
	regex printOn: aStream.
	aStream nextPut: $)