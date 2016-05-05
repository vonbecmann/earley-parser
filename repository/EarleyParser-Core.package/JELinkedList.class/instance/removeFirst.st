removing
removeFirst
	"Remove the first element and answer it. If the receiver is empty, create 
	an error notification."

	| firstElement oldLink |
	firstElement := self first.
	oldLink := firstLink.
	firstLink := firstLink == lastLink
		ifTrue: [ lastLink := nil ]
		ifFalse: [ oldLink nextLink ].
	oldLink nextLink: nil.
	tally := tally - 1.
	^ firstElement