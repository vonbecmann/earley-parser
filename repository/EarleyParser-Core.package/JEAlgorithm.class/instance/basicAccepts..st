private template
basicAccepts: words
	| charts |
	charts := (1 to: words size + 1) collect: [ :index | JEChart number: index ].
	self predictNonterminal: grammar startSymbol at: charts first.
	1 to: words size + 1 do: [ :i | 
		| chart |
		chart := charts at: i.
		chart isEmpty
			ifTrue: [ ^ self failedAtPosition: i ].
		chart
			itemsDo: [ :item | 
				item isFinal
					ifTrue: [ self complete: item at: chart ]
					ifFalse: [ 
						item symbolAtDot isTerminal
							ifTrue: [ 
								(i <= words size and: [ item symbolAtDot matches: (words at: i) ])
									ifTrue: [ self scan: item with: (words at: i) at: (charts at: i + 1) ] ]
							ifFalse: [ self predict: item at: chart ] ] ] ].
	^ charts