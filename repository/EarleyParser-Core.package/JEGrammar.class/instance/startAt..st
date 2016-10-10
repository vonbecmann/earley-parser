instance creation
startAt: aNonterminalNamed
	| newStart definedRules |
	newStart := nonterminals
		detect: [ :each | each named = aNonterminalNamed ]
		ifNone: [ ^ self unknowNonterminal: aNonterminalNamed ].
	definedRules := rules
		reject: [ :each | each head = startSymbol ]
		thenCollect: [ :each | each asDefined ].
	^ self class basedOn: definedRules values startAtNonterminal: newStart