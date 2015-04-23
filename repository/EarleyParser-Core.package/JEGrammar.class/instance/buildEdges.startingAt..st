private
buildEdges: builder startingAt: item
	item edges
		do: [ :edge | 
			edge isReduction
				ifTrue: [ 
					"reduction"
					builder gatherNodeLabeled: edge label from: edge to startChart to: edge to endChart.
					edge from isFinal
						ifTrue: [ 
							| previous |
							previous := edge from rule moveDotBackward.
							previous isDotAtBeginning not
								ifTrue: [ builder gatherNodeLabeled: previous from: edge from startChart to: edge to startChart ].
							builder gatherNodeLabeled: edge from rule head from: edge from startChart to: edge from endChart.
							builder addEdge ]
						ifFalse: [ 
							builder gatherNodeLabeled: edge from rule from: edge from startChart to: edge from endChart.
							builder addEdge ].
					self buildEdges: builder startingAt: edge to ]
				ifFalse: [ 
					"predecessor"
					builder gatherNodeLabeled: edge label from: edge to endChart to: edge from endChart.
					edge to isPredicted not
						ifTrue: [ builder gatherNodeLabeled: edge to rule from: edge to startChart to: edge to endChart ].
					edge from isFinal
						ifTrue: [ builder gatherNodeLabeled: edge from rule head from: edge from startChart to: edge from endChart ]
						ifFalse: [ builder gatherNodeLabeled: edge from rule from: edge from startChart to: edge from endChart ].
					builder addEdge.
					self buildEdges: builder startingAt: edge to ] ]