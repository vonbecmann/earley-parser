instance creation
given: aDottedRule startedAt: column
	"an item for the given dotted rule that started its recognition at the given column"

	^ self basicNew initializeDottedRule: aDottedRule start: column