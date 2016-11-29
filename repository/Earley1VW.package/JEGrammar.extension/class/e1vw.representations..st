*Earley1VW
e1vw: oneLevelVWRuleString representations: terminalNotionToRepresentationList
	" parse 1VW rules from a String and return a grammar "

	^ self
		productionRules: (JE1VWParser new parse: oneLevelVWRuleString)
		representations: terminalNotionToRepresentationList