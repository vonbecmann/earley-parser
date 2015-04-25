testing
includes: aNode
	^ (self from <= aNode from) and: [ aNode to <= self to ]