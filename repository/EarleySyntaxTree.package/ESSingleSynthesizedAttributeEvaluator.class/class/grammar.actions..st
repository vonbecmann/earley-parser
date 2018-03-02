instance creation
grammar: aGrammar actions: ruleAndActionAssociationCollection
	"
	rule -> aBlockWithOneArgument.
	rule is an association like (Nonterminal -> index)	
	"

	^ self basicNew
		initializeGrammar: aGrammar
		andRuleToAction: ruleAndActionAssociationCollection