private template
basicAccepts: words
	| n chart |
	n := words size + 1.
	chart := (1 to: n) collect: [ :index | JEColumn number: index ].
	self predictNonterminal: grammar startSymbol at: chart first.
	1 to: n do: [ :i | 
		| column |
		column := chart at: i.
		column isEmpty ifTrue: [ ^ self failedAt: (chart at: i - 1) ].
		column
			processItems: [ :item | 
				item isFinal
					ifTrue: [ self complete: item at: column ]
					ifFalse: [ 
						item symbolAtDot isTerminal
							ifTrue: [ 
								(i < n and: [ item symbolAtDot matches: (words at: i) ])
									ifTrue: [ self scan: item with: (words at: i) at: (chart at: i + 1) ] ]
							ifFalse: [ self predict: item at: column ] ] ] ].
	^ chart