public
accepts: words
	| itemsets firstRule |
	itemsets := (0 to: words size) collect: [ :index | Set new ].
	firstRule := (JENonterminal for: #Start) body: {(grammar startSymbol)}.
	(itemsets at: 1) add: (JEItem rule: firstRule dotAtBeginningWithItemsetAt: 1).
	"1 to: itemsets size do: [ :index | 
		(itemsets at: index)
			inspectWithLabel:
				(String
					streamContents: [ :s | 
						s
							nextPutAll: 'itemset [';
							nextPutAll: index asString;
							nextPutAll: ']' ]) ]."
	1 to: words size + 1 do: [ :i | 
		| processed itemset |
		processed := Set new.
		itemset := itemsets at: i.
		[ 
		processed
			addAll:
				((itemset difference: processed)
					collect: [ :item | 
						(item isFinal not and: [ item symbolAtDot isNonTerminal ])
							ifTrue: [ 
								itemset
									addAll:
										((grammar alternativesOf: item symbolAtDot) collect: [ :rule | JEItem rule: rule dotAtBeginningWithItemsetAt: i ]) ].
						(item isFinal not
							and: [ item symbolAtDot isTerminal and: [ i <= words size and: [ item symbolAtDot equals: (words at: i) ] ] ])
							ifTrue: [ (itemsets at: i + 1) add: item moveDotForward ].
						item isFinal
							ifTrue: [ 
								itemset
									addAll:
										(((itemsets at: item itemset) select: [ :anItem | anItem symbolAtDot = item rule head ])
											collect: [ :anItem | anItem moveDotForward ]) ].
						item ]) ] doWhileFalse: [ (itemset difference: processed) isEmpty ] ].
	^ (itemsets at: words size + 1) includes: (JEItem rule: firstRule dotAtEndWithItemsetAt: 1)