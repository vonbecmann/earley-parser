Extension { #name : #JETerminalItem }

{ #category : #'*EarleySyntaxTree' }
JETerminalItem >> asSyntaxNode [
	^ ESSyntaxNode
		symbol: terminal
		reason: word
		start: start number
		end: end number
]
