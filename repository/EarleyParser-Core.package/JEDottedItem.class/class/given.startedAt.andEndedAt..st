instance creation
given: aDottedRule startedAt: start andEndedAt: end
	"an item for the given dotted rule that started its recognition at the given item sets"

	^ (self given: aDottedRule startedAt: start)
		end: end;
		yourself