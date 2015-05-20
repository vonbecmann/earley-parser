private
scan: item with: word at: chart
	"scan"

	| next |
	next := chart add: item moveDotForward.
	self addEdgeSourceNodes: item word: word toTargetNode: next