initialization
initializeRules: aRuleCollection
	| ruleSet ruleIndex |
	ruleSet := Set
		withAll: 
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
	ruleIndex := [ 
		| index |
		index := Dictionary
			newFrom: (ruleSet collect: [ :rule | rule -> (aRuleCollection findFirst: [ :each | rule equals: each ]) ]).
		[ :a :b | (index at: a) < (index at: b) ] ] value.
	
	(ruleSet asSortedCollection: ruleIndex) do: [ :eachRule | rules at: eachRule head put: eachRule ]. 
