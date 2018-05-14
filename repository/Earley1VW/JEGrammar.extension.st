Extension { #name : #JEGrammar }

{ #category : #'*Earley1VW' }
JEGrammar class >> e1vw: oneLevelVWRuleString representations: terminalNotionToRepresentationList [
	" parse 1VW rules from a String and return a grammar "
	| productionRulesArray nonterminals terminals lineup unique index rules |
	self
		assert: terminalNotionToRepresentationList isNotEmpty
		description: 'The collection of rules cannot be empty.'.
	productionRulesArray := JE1VWParser instance parse: oneLevelVWRuleString.
	nonterminals := Set new.
	productionRulesArray
		do: [ :each | nonterminals add: each head ].
	terminalNotionToRepresentationList
		do: [ :assoc | nonterminals add: (NCNonterminal named: assoc key) ].
	terminals := Set new.
	terminalNotionToRepresentationList do: [ :assoc | terminals add: assoc value ].
	lineup := OrderedCollection new.
	unique := Set new.
	productionRulesArray
		collect: [ :each | 
			NCProductionRule
				head: (nonterminals detect: [ :nonterminal | nonterminal = each head ])
				body: 	(each body
								collect: 
									[ :notion | 
										nonterminals
											detect: [ :nonterminal | nonterminal = notion ]
											ifNone: [ self unknowNonterminal: notion in: each ] ]) ]
		thenDo: 
			[:rule | 
				lineup add: rule.
				unique add: rule. ].
	terminalNotionToRepresentationList
			collect: [ :assoc | 
				NCProductionRule
					head: (nonterminals detect: [ :nonterminal | nonterminal named = assoc key ])
					body: {(terminals like: assoc value)} ]
			thenDo: 
				[:rule | 
					lineup add: rule.
					unique add: rule. ].
	index := Dictionary new.
	unique
		collect: [ :rule | rule -> (lineup findFirst: [ :each | rule = each ]) ]
		thenDo: [ :assoc | index add: assoc ].
	rules := unique sorted: [ :a :b | (index at: a) < (index at: b) ].
	^ self basicNew
		initializeProductionRules: rules
		nonterminals: nonterminals 
		terminals: terminals
		startNonterminal: rules first head

]
