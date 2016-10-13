instance creation
startAt: aNonterminalNamed
	| newStart definedRules |
	newStart := self nonterminal: aNonterminalNamed.
	definedRules := rules 
							reject: [ :each | each head = startSymbol ] 
							thenCollect: [ :each | each asDefined ].
	^ self class basedOn: definedRules values startAtNonterminal: newStart