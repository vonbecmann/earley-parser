parsing
parseGrammarFrom: spec
	| terminals nonterminals alphabet rules |
	nonterminals := spec collect: [ :each | JENonterminal for: each first ] as: Set.
	terminals := (spec flatCollect: [ :each | each second ] as: Set)
		reject: [ :each | nonterminals includes: (JENonterminal for: each) ]
		thenCollect: [ :each | JETerminal for: each ].
	alphabet := (nonterminals , terminals) asDictionary.
	rules := spec
		collect: [ :each | JERule left: (alphabet at: each first) right: (each second collect: [ :another | alphabet at: another ]) ]
		as: Set.
	^ JEGrammar nonterminals: nonterminals terminals: terminals rules: rules