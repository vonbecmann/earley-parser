private
scan: item with: word at: chart
	"scan"

	| forwardedItem |
	forwardedItem := chart add: item moveDotForward.
	chart addEdgeLabeled: (item symbolAtDot -> word) from: forwardedItem to: item