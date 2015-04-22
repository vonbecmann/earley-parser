adding edges
addEdge
	"adds a new edge with the accumulated nodes up to now"

	accumulatedNodes isEmpty
		ifTrue: [ ^ Error signal: 'a hyperedge needs at least one node' ].
	edges add: (JEHyperedge nodes: accumulatedNodes).
	accumulatedNodes := Set new