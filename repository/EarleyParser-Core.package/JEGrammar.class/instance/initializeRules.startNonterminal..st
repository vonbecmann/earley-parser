initialization
initializeRules: aCollection startNonterminal: aNonterminal
	| index aRuleCollection |
	self initialize.
	aRuleCollection := (OrderedCollection with: (startSymbol is: aNonterminal))
		addAll: aCollection;
		yourself.
	nonterminals := aRuleCollection collect: [ :each | each head ] as: Set.
	index := (nonterminals collect: [ :each | each -> (aRuleCollection findFirst: [ :rule | rule head = each ]) ])
		asDictionary.
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
	nonterminals := nonterminals sorted: [ :a :b | (index at: a) <= (index at: b) ].
	nonterminals
		do: [ :nonterminal | 
			alternatives
				at: nonterminal
				putAll: (rules select: [ :rule | rule head = nonterminal ] thenCollect: [ :rule | rule dotAtBeginning ]) ]