adding
addLast: anObject
	"Add a link to the end of the receiver's list."

	| link |
	link := JELink with: anObject.
	firstLink ifNil: [ firstLink := link ] ifNotNil: [ lastLink nextLink: link ].
	lastLink := link.
	tally := tally + 1.
	^ anObject