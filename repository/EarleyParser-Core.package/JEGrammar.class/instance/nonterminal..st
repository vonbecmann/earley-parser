private
nonterminal: aNonterminalNamed
	^ nonterminals
		detect: [ :each | each named = aNonterminalNamed ]
		ifNone: [ self unknowNonterminal: aNonterminalNamed ]