testing
size
	"the sum of the cardinalities of its hyperedges"

	^ edges inject: 0 into: [ :sum :each | sum + each cardinality ]