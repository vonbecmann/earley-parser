private
descriptionPrintOn: aStream
	self symbol do: [ :each | aStream nextPut: each ]