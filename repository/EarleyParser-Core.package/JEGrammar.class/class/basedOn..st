instance creation
basedOn: aCollectionOfRules
	"a grammar based on a collection of rules, starting at the first rule's left hand."

	self
		assert: aCollectionOfRules isNotEmpty
		description: 'The collection of rules cannot be empty.'.
	^ self basedOn: aCollectionOfRules startAtNonterminal: aCollectionOfRules first head