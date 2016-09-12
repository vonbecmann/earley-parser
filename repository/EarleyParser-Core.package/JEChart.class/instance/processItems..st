accessing
processItems: aBlock
	"process each item in order"

	[ items isEmpty ] whileFalse: [ aBlock value: items removeFirst ]