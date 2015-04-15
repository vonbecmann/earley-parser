adding
addLast: anObject
	"Add a link to the end of the receiver's list. Answer a link."

	| link |
	link := JELink value: anObject.
	self isEmpty
		ifTrue: [ firstLink := link ]
		ifFalse: [ lastLink nextLink: link ].
	lastLink := link.
	^ link