enumerating
anySatisfy: aBlock
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	^ self detect: aBlock ifFound: [ :elem | true ] ifNone: [ false ]