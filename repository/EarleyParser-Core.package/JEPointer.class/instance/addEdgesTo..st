hypergraph
addEdgesTo: builder
	"add a hyperedge with its source nodes and target node"

	builder
		gatherTargetNodeLabeled:
			(self from isFinal
				ifTrue: [ self from head ]
				ifFalse: [ self from rule ])
		from: self from startChart
		to: self from endChart.
	builder 
		gatherSourceNodeLabeled: self label 
		from: self to endChart 
		to: self from endChart.
	self to isPredicted
		ifFalse: [ 
			builder 
				gatherSourceNodeLabeled: self to rule 
				from: self to startChart 
				to: self to endChart ].
	builder addEdge