Extension { #name : #JEDottedItem }

{ #category : #'*EarleySyntaxTree' }
JEDottedItem >> asSyntaxNodeOf: grammar [
	^ ESSyntaxNode
		symbol: self head
		reason: (grammar productionRuleAt: self rule)
		start: start number
		end: end number
]
