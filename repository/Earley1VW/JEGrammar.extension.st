Extension { #name : #JEGrammar }

{ #category : #'*Earley1VW' }
JEGrammar class >> e1vw: oneLevelVWRuleString representations: terminalNotionToRepresentationList [
	" parse 1VW rules from a String and return a grammar "

	^ self
		productionRules: (JE1VWParser instance parse: oneLevelVWRuleString)
		representations: terminalNotionToRepresentationList
]
