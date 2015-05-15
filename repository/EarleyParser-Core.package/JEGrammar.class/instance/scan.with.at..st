private
scan: item with: word at: chart
	"scan"

	| forwardedItem match |
	forwardedItem := chart add: item moveDotForward.
	match := JETerminalMatch
		this: word
		matches: item symbolAtDot
		between: item endChart
		and: forwardedItem endChart.
	
	self addEdgeTarget: forwardedItem source: item and: match