adding
add: anItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	itemsByKey jeAt: anItem key ifPresent: [:found | ^ found ] ifAbsentPut: anItem.
	
	anItem isFinal
		ifTrue: [ 
			anItem startChart = self
				ifTrue: [ finalItemsByNonterminal at: anItem head add: anItem ] ]
		ifFalse: [ 
			anItem symbolAtDot isTerminal
				ifFalse: [ predictionItemsByNonterminal at: anItem symbolAtDot add: anItem ] ].
	items addLast: anItem.
	anItem endChart: self.
	^ anItem