instance creation
given: aDottedRule startedAt: firstColumn andEndedAt: secondColumn
	"an item for the given dotted rule that started its recognition at the given columns"

	^ (self given: aDottedRule startedAt: firstColumn)
		end: secondColumn;
		yourself