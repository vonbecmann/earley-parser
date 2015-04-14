private
descriptionPrintOn: aStream
	symbol do: [ :each | aStream nextPut: each ]