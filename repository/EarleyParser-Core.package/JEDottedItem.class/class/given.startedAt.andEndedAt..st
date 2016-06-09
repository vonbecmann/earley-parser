instance creation
given: aDottedRule startedAt: aChart andEndedAt: anotherChart
	"an item for the given dotted rule that started its recognition at the given chart"

	^ (self given: aDottedRule startedAt: aChart)
		endChart: anotherChart;
		yourself