evaluation
evaluateSynthesizedAttribute: ruleAndActionAssociationCollection
	"
	rule -> aBlockWithOneArgument.
	rule is an association like (Nonterminal -> index)	
	"

	| ruleToActionDict |
	ruleToActionDict := Dictionary new.
	ruleAndActionAssociationCollection do: [ :each | ruleToActionDict at: (grammar ruleAt: each key) put: each value ].
	^ self basicEvaluateSynthesizedAttributeWith: ruleToActionDict