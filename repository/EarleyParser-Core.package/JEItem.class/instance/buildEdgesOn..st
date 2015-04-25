hypergraph
buildEdgesOn: builder
	edges
		do: [ :edge | 
			builder
				gatherNodeLabeled:
					(edge from isFinal
						ifTrue: [ edge from rule head ]
						ifFalse: [ edge from rule ])
				from: edge from startChart
				to: edge from endChart.
			edge isReduction
				ifTrue: [ 
					"reduction"
					builder gatherNodeLabeled: edge label from: edge to startChart to: edge to endChart.
					edge from isFinal
						ifTrue: [ 
							| previous |
							previous := edge from rule moveDotBackward.
							previous isDotAtBeginning not
								ifTrue: [ builder gatherNodeLabeled: previous from: edge from startChart to: edge to startChart ] ] ]
				ifFalse: [ 
					"predecessor"
					builder gatherNodeLabeled: edge label from: edge to endChart to: edge from endChart.
					edge to isPredicted not
						ifTrue: [ builder gatherNodeLabeled: edge to rule from: edge to startChart to: edge to endChart ] ].
			builder addEdge.
			edge to buildEdgesOn: builder ]