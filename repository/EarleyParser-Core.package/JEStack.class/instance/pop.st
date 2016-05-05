removing
pop
	"Returns the first element and remove it from the stack."

	| firstElement |
	firstElement := self top.
	firstLink := firstLink nextLink.
	tally := tally - 1.
	^ firstElement