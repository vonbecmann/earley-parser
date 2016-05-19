initialization
initializeRules: aRuleCollection
	rules
		addAll:
			(aRuleCollection
				collect: [ :rule | 
					JERule
						head: (nonterminals like: rule head)
						body:
							(rule body
								collect: [ :symbol | 
									symbol isTerminal
										ifTrue: [ terminals like: symbol ]
										ifFalse: [ nonterminals like: symbol ifAbsent: [ self unknowNonterminal: symbol in: rule ] ] ]) ]).
	ruleIndex := Dictionary
		newFrom: (rules collect: [ :rule | rule -> (aRuleCollection findFirst: [ :each | rule equals: each ]) ]).
	ruleSort := [ :a :b | (ruleIndex at: a) < (ruleIndex at: b) ]