public
accepts: aString
	| i itemsets firstRule |
	itemsets := (0 to: aString size) collect: [ :index | Set new ].
	firstRule := JERule left: (JENonterminal for: #Start) right: {(grammar startSymbol)}.
	(itemsets at: 1) add: (JEItem rule: firstRule itemsetAt: 1).
	i := 1.
	(itemsets at: i) asOrderedCollection
		do: [ :each | 
			(each isFinal not and: [ each symbolAtDot isNonTerminal ])
				ifTrue: [ grammar altenativesOf: each symbolAtDot ] ].
	^ true