instance creation
basedOn: aCollectionOfRules
	"a grammar based on a collection of rules, starting at the first rule's left hand."

	self assert: aCollectionOfRules isEmpty not description: 'The collection of rules cannot be empty.'.
	^ self basicNew initializeRules: aCollectionOfRules startNonterminal: aCollectionOfRules first head