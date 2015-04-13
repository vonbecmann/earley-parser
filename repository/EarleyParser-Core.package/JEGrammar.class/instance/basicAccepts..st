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
					ifTrue: [ self complete: item at: chart ]
					ifFalse: [ 
						item symbolAtDot isTerminal
							ifTrue: [ 
								(i <= words size and: [ item symbolAtDot equals: (words at: i) ])
									ifTrue: [ self scan: item at: (charts at: i + 1) ] ]
							ifFalse: [ self predict: item at: chart ] ] ] ].
	^ charts