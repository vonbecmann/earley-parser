instance creation
basedOn: aCollectionOfRules
	"a grammar based on a collection of rules, starting at the first rule's left hand."

	| productionRules |
	self
		assert: aCollectionOfRules isNotEmpty
		description: 'The collection of rules cannot be empty.'.
	productionRules := aCollectionOfRules
		collect: [ :each | JEProductionRule head: each key body: each value ].
	^ self basedOn: productionRules startAtNonterminal: productionRules first head