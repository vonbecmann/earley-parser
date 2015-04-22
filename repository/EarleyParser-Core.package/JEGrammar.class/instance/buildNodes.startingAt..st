private
buildNodes: builder startingAt: item
	item edges
		do: [ :edge | 
			edge isReduction
				ifTrue: [ 
					"reduction"
					builder addNodeLabeled: edge label from: edge to startChart to: edge to endChart.
					self buildNodes: builder startingAt: edge to ]
				ifFalse: [ 
					"predecessor"
					builder addNodeLabeled: edge label from: edge to endChart to: edge from endChart.
					edge to hasPredecessor
						ifTrue: [ builder addNodeLabeled: edge to rule from: edge to startChart to: edge to endChart ].
					self buildNodes: builder startingAt: edge to ] ]