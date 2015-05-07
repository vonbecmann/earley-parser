printing
printOn: aStream
	"<name>"

	aStream nextPut: $<.
	self named do: [ :each | aStream nextPut: each ].
	aStream nextPut: $>