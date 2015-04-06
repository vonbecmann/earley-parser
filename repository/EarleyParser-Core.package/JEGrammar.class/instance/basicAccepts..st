private
basicAccepts: words
	| charts |
	charts := (1 to: words size + 1) collect: [ :index | JEChart number: index ].
	charts first add: (self startRule dotAtBeginning startedAt: charts first).
	debugOn
		ifTrue: [ charts inspectWithLabel: 'All charts' ].
	1 to: words size + 1 do: [ :i | 
		| chart |
		chart := charts at: i.
		chart items
			do: [ :item | 
				item isFinal
					ifTrue: [ 
						"complete"
						chart addAll: (item collectPredictionItemsUsing: [ :anItem | anItem moveDotForward ]) ]
					ifFalse: [ 
						item symbolAtDot isTerminal
							ifTrue: [ 
								(i <= words size and: [ item symbolAtDot equals: (words at: i) ])
									ifTrue: [ 
										"scan"
										(charts at: i + 1) add: item moveDotForward ] ]
							ifFalse: [ 
								"predict: add all respective predicted items for the given collection of rules"
								chart
									addAll: (	(self alternativesOf: item symbolAtDot) 
													collect: [ :rule | rule dotAtBeginning startedAt: chart ]) ] ] ] ].
	^ charts