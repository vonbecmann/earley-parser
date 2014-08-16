parsing
parseGrammarFrom: spec
	| terminals nonterminals alphabet rules startSymbol |
	nonterminals := spec collect: [ :each | JENonterminal for: each first ] as: Set.
	startSymbol := JENonterminal for: spec first first.
	terminals := (spec flatCollect: [ :each | each second ] as: Set)
		reject: [ :each | nonterminals includes: (JENonterminal for: each) ]
		thenCollect: [ :each | JETerminal for: each ].
	self assert: (nonterminals & terminals) isEmpty.
	alphabet := (nonterminals , terminals) asDictionary.
	rules := spec
		collect: [ :each | JERule left: (alphabet at: each first) right: (each second collect: [ :another | alphabet at: another ]) ]
		as: Set.
	^ JEGrammar nonterminals: nonterminals terminals: terminals rules: rules startSymbol: startSymbol 