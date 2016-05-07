accessing
second
	"Answer the second element of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstLink
		ifNil: [ self emptyError ]
		ifNotNil: [ firstLink nextLink ifNil: [ self emptyError ] ifNotNil: [ firstLink nextLink value ] ]