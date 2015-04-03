printing
printOn: aStream
	"<symbol>"

	aStream nextPut: $<.
	symbol asString do: [ :each | aStream nextPut: each ].
	aStream nextPut: $>