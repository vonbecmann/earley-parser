Extension { #name : 'Association' }

{ #category : '*EarleyParser-Core' }
Association >> buildProductionRuleGiven: grammarBuilder [
	^ NCProductionRule
		head: (grammarBuilder nonTerminalNamed: self key)
		body: {(grammarBuilder terminalLike: self value)}
]
