removing
removeFirst
	"Remove the first element and answer it. If the receiver is empty, create 
	an error notification."

	| oldLink |
	self emptyCheck.
	oldLink := firstLink.
	firstLink := firstLink == lastLink
		ifTrue: [ lastLink := nil ]
		ifFalse: [ oldLink nextLink ].
	oldLink nextLink: nil.
	^ oldLink value