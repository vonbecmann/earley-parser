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
	ruleSort := [ 
		| index |
		index := Dictionary
			newFrom: (rules collect: [ :rule | rule -> (aRuleCollection findFirst: [ :each | rule equals: each ]) ]).
		[ :a :b | (index at: a) < (index at: b) ] ] value
