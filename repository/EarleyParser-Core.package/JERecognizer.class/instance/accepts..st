public
accepts: words
	| itemsets |
	itemsets := (0 to: words size) collect: [ :index | Set new ].
	(itemsets at: 1)
		add: (JEItem rule: (JERule left: (JENonterminal for: #Start) right: {(grammar startSymbol)}) itemsetAt: 1).
	1 to: itemsets size do: [ :index | (itemsets at: index) inspectWithLabel: 'itemset [' , index asString , ']' ].
	1 to: words size + 1 do: [ :i | 
		| processed itemset |
		processed := Set new.
		itemset := itemsets at: i.
		[ 
		(itemset difference: processed)
			do: [ :item | 
				item isPredicted
					ifTrue: [ itemset addAll: ((grammar alternativesOf: item symbolAtDot) collect: [ :rule | JEItem rule: rule itemsetAt: i ]) ].
				(((item isFinal not and: [ item symbolAtDot isTerminal ]) and: [ i <= words size ])
					and: [ item symbolAtDot equals: (words at: i) ])
					ifTrue: [ (itemsets at: i + 1) add: item moveDotForward ].
				item isFinal
					ifTrue: [ 
						itemset
							addAll:
								(((itemsets at: item itemset) select: [ :anItem | anItem symbolAtDot = item rule left ])
									collect: [ :anItem | anItem moveDotForward ]) ].
				processed add: item ] ] doWhileFalse: [ (itemset difference: processed) isEmpty ] ].
	^ (itemsets at: words size + 1)
		includes:
			(JEItem
				rule: (JERule left: (JENonterminal for: #Start) right: {(grammar startSymbol)})
				dotAt: words size + 1
				itemsetAt: 1)