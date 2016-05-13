testing
rank
	"is the maximum cardinality of any of its hyperedges"

	^ edges inject: 0 into: [ :max :each | max max: each cardinality ]