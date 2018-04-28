Extension { #name : #SinglyLinkedStack }

{ #category : #'*EarleySyntaxTree' }
SinglyLinkedStack >> popReversed: nElements [
	"pop n elements in reverse order and return those elements"

	| elements |
	elements := Array new: nElements.
	nElements to: 1 by: -1 do: [ :i | elements at: i put: self pop ].
	^ elements
]
