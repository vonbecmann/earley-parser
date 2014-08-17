public
accepts: aString
	| itemsets itemset firstRule processed input |
	itemsets := (0 to: aString size) collect: [ :index | Set new ].
	firstRule := JERule left: (JENonterminal for: #Start) right: {(grammar startSymbol)}.
	(itemsets at: 1) add: (JEItem rule: firstRule itemsetAt: 1).
	1 to: aString size + 1 do: [ :i | 
		itemset := itemsets at: i.
		input := (aString at: i) asString.
		processed := Set new.
		[ 
		(itemset difference: processed)
			do: [ :item | 
				item isPredicted
					ifTrue: [ itemset addAll: ((grammar alternativesOf: item symbolAtDot) collect: [ :rule | JEItem rule: rule itemsetAt: i ]) ].
				((item isFinal not and: [ item symbolAtDot isTerminal ]) and: [ item symbolAtDot equals: input ])
					ifTrue: [ (itemsets at: i + 1) add: item moveDotForward ].
				processed add: item ] ] doWhileFalse: [ (itemset difference: processed) isEmpty ] ].
	^ true