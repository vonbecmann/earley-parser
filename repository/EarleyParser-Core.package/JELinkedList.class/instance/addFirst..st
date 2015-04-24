adding
addFirst: anObject
	"Add a link to the beginning of the receiver's list."

	| link |
	link := JELink value: anObject.
	self isEmpty
		ifTrue: [ lastLink := link ].
	link nextLink: firstLink.
	firstLink := link.
	^ anObject