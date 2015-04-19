private
scan: item at: chart
	"scan"

	| forwardedItem |
	forwardedItem := chart add: item moveDotForward.
	forwardedItem addEdgeLabeled: item symbolAtDot to: item