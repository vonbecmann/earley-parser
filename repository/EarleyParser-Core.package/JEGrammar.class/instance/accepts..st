public
accepts: words
	| charts |
	charts := (1 to: words size + 1) collect: [ :index | JEChart number: index ].
	charts first addPredictedItem: self startRule.
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
						chart addAll: ((item chart predictionItemsWithDotAt: item rule head) collect: [ :anItem | anItem moveDotForward ]) ]
					ifFalse: [ 
						item symbolAtDot isTerminal
							ifTrue: [ 
								(i <= words size and: [ item symbolAtDot equals: (words at: i) ])
									ifTrue: [ 
										"scan"
										(charts at: i + 1) add: item moveDotForward ] ]
							ifFalse: [ 
								"predict"
								chart addAllPredictedItems: (self alternativesOf: item symbolAtDot) ] ] ] ].
	^ charts last includes: (JEItem rule: self startRule dotAtEndWithChart: charts first)