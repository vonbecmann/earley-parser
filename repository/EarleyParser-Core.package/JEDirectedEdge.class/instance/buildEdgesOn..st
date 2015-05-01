hypergraph
buildEdgesOn: builder
	"build a hyperedge with its source nodes and target node"

	builder
		gatherTargetNodeLabeled:
			(self from isFinal
				ifTrue: [ self from rule head ]
				ifFalse: [ self from rule ])
		from: self from startChart
		to: self from endChart.
	self isReduction
		ifTrue: [ 
			| previous |
			builder
				gatherSourceNodeLabeled: self label 
				from: self to startChart 
				to: self to endChart.
			previous := self from moveDotBackward.
			previous isPredicted
				ifFalse: [ builder gatherSourceNodeLabeled: previous rule
										from: self from startChart 
										to: self to startChart ] ]
		ifFalse: [ 
			builder
				gatherSourceNodeLabeled: self label 
				from: self to endChart 
				to: self from endChart.
			self to isPredicted
				ifFalse: [ builder	gatherSourceNodeLabeled: self to rule 
										from: self to startChart 
										to: self to endChart ] ].
	builder addEdge