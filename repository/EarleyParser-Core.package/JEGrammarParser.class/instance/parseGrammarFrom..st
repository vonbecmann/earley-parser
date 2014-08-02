parsing
parseGrammarFrom: spec
	| terminals nonterminals alphabet rules |
	nonterminals := spec collect: [ :each | JENonterminal for: each first ] as: Set.
	terminals := Set new.
	spec
		do: [ :each | 
			each second
				do: [ :another | 
					(nonterminals includes: (JENonterminal for: another))
						ifFalse: [ terminals add: (JETerminal for: another) ] ] ].
	alphabet := (nonterminals , terminals) asDictionary.
	rules := spec
		collect: [ :each | 
			| left right |
			left := alphabet at: each first.
			right := each second collect: [ :another | alphabet at: another ].
			JERule left: left right: right ].
	^ JEGrammar nonterminals: nonterminals terminals: terminals rules: rules