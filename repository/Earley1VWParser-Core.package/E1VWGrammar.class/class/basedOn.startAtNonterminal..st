private
basedOn: aCollectionOfRules startAtNonterminal: aJENonterminal
	"a grammar based on a collection of rules, starting at the given nonterminal."

	self
		assert: aCollectionOfRules isNotEmpty
		description: 'The collection of rules cannot be empty.'.
	^ self basicNew initializeRules: aCollectionOfRules startNonterminal: aJENonterminal