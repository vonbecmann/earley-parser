private
scan: item at: chart
	"scan"

	| forwardedItem |
	forwardedItem := chart add: item moveDotForward.
	chart addEdgeLabeled: item symbolAtDot from: forwardedItem to: item