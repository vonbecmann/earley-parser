Extension { #name : 'Array' }

{ #category : '*EarleyParser-Core' }
Array >> asProductionRule [
	^ NCProductionRule
		headNamed: self first
		body: (self second collect: [ :notion | NCNonterminal named: notion ])
]
