printing
printOn: aStream
	"name"

	self named do: [ :each | aStream nextPut: each ]