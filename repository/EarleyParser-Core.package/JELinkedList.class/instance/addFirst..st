adding
addFirst: anObject
	"Add a link to the beginning of the receiver's list."

	| link |
	link := JELink value: anObject next: firstLink.
	firstLink ifNil: [ lastLink := link ].
	firstLink := link.
	tally := tally + 1.
	^ anObject