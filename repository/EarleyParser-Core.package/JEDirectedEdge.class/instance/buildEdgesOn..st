hypergraph
buildEdgesOn: builder
	"build a hyperedge with its nodes"

	builder
		gatherNodeLabeled:
			(self from isFinal
				ifTrue: [ self from rule head ]
				ifFalse: [ self from rule ])
		from: self from startChart
		to: self from endChart.
	self isReduction
		ifTrue: [ 
			"reduction"
			builder gatherNodeLabeled: self label from: self to startChart to: self to endChart.
			self from isFinal
				ifTrue: [ 
					| previous |
					previous := self from rule moveDotBackward.
					previous isDotAtBeginning not
						ifTrue: [ builder gatherNodeLabeled: previous from: self from startChart to: self to startChart ] ] ]
		ifFalse: [ 
			"predecessor"
			builder gatherNodeLabeled: self label from: self to endChart to: self from endChart.
			self to isPredicted not
				ifTrue: [ builder gatherNodeLabeled: self to rule from: self to startChart to: self to endChart ] ].
	builder addEdge