adding
push: anObject
	"Adds a new object of any kind on top of the stack."

	firstLink := JELink with: anObject next: firstLink.
	tally := tally + 1.
	^ anObject