adding
add: anItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	(self itemsAt: anItem startChart)
		do: [ :each | 
			each dottedRule = anItem dottedRule
				ifTrue: [ ^ each ] ].
	itemsByChart at: anItem startChart put: anItem.
	anItem isFinal
		ifTrue: [ 
			anItem startChart = self
				ifTrue: [ finalItemsByNonterminal at: anItem head put: anItem ] ]
		ifFalse: [ 
			anItem symbolAtDot isTerminal
				ifFalse: [ predictionItemsByNonterminal at: anItem symbolAtDot put: anItem ] ].
	items addLast: anItem.
	anItem endChart: self.
	^ anItem