private
scan: item with: word at: chart
	"scan"

	| forwardedItem match |
	match := JETerminalMatch this: word matches: item symbolAtDot.
	forwardedItem := chart add: item moveDotForward.
	"chart addPointerLabeled: match from: forwardedItem backTo: item."
	self addEdgeLabeled: match from: forwardedItem to: item.