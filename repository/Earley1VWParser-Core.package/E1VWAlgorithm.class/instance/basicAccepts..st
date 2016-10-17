private template
basicAccepts: words
	| charts |
	charts := (1 to: words size + 1) collect: [ :index | JEChart number: index ].
	self predictNonterminal: grammar startSymbol at: charts first.
	1 to: words size + 1 do: [ :i | 
		| chart |
		chart := charts at: i.
		chart isEmpty
			ifTrue: [ ^ self failedAt: (charts at: i - 1) ].
		i <= words size
			ifTrue: 
				[ grammar representationRules
						do: [ :rule | 
							(rule dotAtBeginning symbolAtDot matches: (words at: i))
								ifTrue: 
									[ self 
										scan: (rule dotAtBeginning startedAt: chart andEndedAt: chart) 
										with: (words at: i) 
										at: (charts at: i + 1) ] ] ].
		chart
			processItems: [ :item | 
				item isFinal
					ifTrue: [ self complete: item at: chart ]
					ifFalse: [ item symbolAtDot isTerminal ifFalse: [ self predict: item at: chart ] ] ] ].
	^ charts