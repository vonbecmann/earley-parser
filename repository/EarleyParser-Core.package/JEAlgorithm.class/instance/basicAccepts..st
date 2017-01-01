private template
basicAccepts: words
	| chart |
	chart := (1 to: words size + 1) collect: [ :index | JEItemSet number: index ].
	self predictNonterminal: grammar startSymbol at: chart first.
	1 to: words size + 1 do: [ :i | 
		| itemSet |
		itemSet := chart at: i.
		itemSet isEmpty ifTrue: [ ^ self failedAt: (chart at: (i - 1)) ].
		itemSet
			processItems: [ :item | 
				item isFinal
					ifTrue: [ self complete: item at: itemSet ]
					ifFalse: [ 
						item symbolAtDot isTerminal
							ifTrue: [ 
								(i <= words size and: [ item symbolAtDot matches: (words at: i) ])
									ifTrue: [ self scan: item with: (words at: i) at: (chart at: i + 1) ] ]
							ifFalse: [ self predict: item at: itemSet ] ] ] ].
	^ chart