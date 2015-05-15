private
scan: item with: word at: chart
	"scan"

	| forwardedItem terminalItem |
	forwardedItem := chart add: item moveDotForward.
	terminalItem := (JETerminalMatch this: word matches: item symbolAtDot)
		startedAt: item endChart
		andEndedAt: forwardedItem endChart.
	self addEdgeTarget: forwardedItem source: item and: terminalItem