initialization
initializeRules: aCollection startNonterminal: aNonterminal
	| aRuleCollection |
	self initialize.
	aRuleCollection := (OrderedCollection with: (startSymbol is: aNonterminal))
		addAll: aCollection;
		yourself.
	nonterminals := aRuleCollection collect: [ :each | each head ] as: Set.
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
										ifTrue: [ symbol ]
										ifFalse: [ nonterminals like: symbol ifAbsent: [ self unknowNonterminal: symbol in: rule ] ] ]) ]).
	startRule := rules like: (startSymbol is: aNonterminal).
	nonterminals
		do: [ :nonterminal | 
			alternatives
				at: nonterminal
				putAll: (rules select: [ :rule | rule head = nonterminal ] thenCollect: [ :rule | rule dotAtBeginning ]) ]