adding
add: anItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	(self itemsAt: anItem startChart)
		do: [ :each | 
			(each equals: anItem)
				ifTrue: [ ^ each ] ].
	self itemsAt: anItem startChart put: anItem.
	(anItem isFinal or: [ anItem symbolAtDot isTerminal ])
		ifFalse: [ predictionItemsByNonterminal at: anItem symbolAtDot put: anItem ].
	(anItem isFinal and: [ anItem startChart = self ])
		ifTrue: [ finalItemsByNonterminal at: anItem head put: anItem ].
	items addLast: anItem.
	anItem endChart: self.
	^ anItem