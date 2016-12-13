instance creation
basedOn: aCollectionOfRules
	"a grammar based on a collection of rules, starting at the first rule's left hand."

	| productionRules |
	self
		assert: aCollectionOfRules isNotEmpty
		description: 'The collection of rules cannot be empty.'.
	productionRules := aCollectionOfRules
		collect: [ :each | JEProductionRule head: each first body: each second ].
	^ self basedOn: productionRules startAtNonterminal: productionRules first head