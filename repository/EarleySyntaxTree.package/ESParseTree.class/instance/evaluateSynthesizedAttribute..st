evaluation
evaluateSynthesizedAttribute: ruleAndActionAssociationCollection
	"
	rule -> aBlockWithOneArgument.
	rule is an association like (Nonterminal -> index)	
	"

	| ruleAndActionDict |
	ruleAndActionDict := Dictionary new.
	ruleAndActionAssociationCollection do: [ :each | ruleAndActionDict at: (grammar ruleAt: each key) put: each value ].
	^ self basicEvaluateSynthesizedAttributeWith: ruleAndActionDict