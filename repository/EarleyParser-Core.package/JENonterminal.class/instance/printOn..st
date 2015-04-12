printing
printOn: aStream
	"<name>"

	aStream nextPut: $<.
	name do: [ :each | aStream nextPut: each ].
	aStream nextPut: $>