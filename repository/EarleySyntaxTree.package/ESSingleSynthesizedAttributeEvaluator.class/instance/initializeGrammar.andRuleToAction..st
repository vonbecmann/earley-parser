initialization
initializeGrammar: aGrammar andRuleToAction: ruleAndActionAssociationCollection
	"
	rule -> aBlockWithOneArgument.
	rule is an association like (Nonterminal -> index)	
	"

	self initialize.
	grammar := aGrammar.
	ruleAndActionAssociationCollection do: [ :each | ruleToAction at: (grammar ruleAt: each key) put: each value ]