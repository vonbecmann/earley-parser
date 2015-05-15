private
scan: item with: word at: chart
	"scan"

	| next terminal |
	next := chart add: item moveDotForward.
	terminal := (JETerminalMatch this: word matches: item symbolAtDot) 
							startedAt: item endChart andEndedAt: next endChart.
	self addEdgeSourceNodes: item and: terminal toTargetNode: next