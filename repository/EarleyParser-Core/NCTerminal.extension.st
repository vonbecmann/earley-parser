Extension { #name : 'NCTerminal' }

{ #category : '*EarleyParser-Core' }
NCTerminal >> match: anObject startedAt: column [
	"an item of myself that match an object and started at the given column."

	^ JETerminalItem given: self word: anObject startedAt: column
]
