instance creation
given: aDottedRule startedAt: itemSet
	"an item for the given dotted rule that started its recognition at the given item set"

	^ self basicNew initializeDottedRule: aDottedRule start: itemSet