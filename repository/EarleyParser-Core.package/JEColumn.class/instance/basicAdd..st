private
basicAdd: anItem
	itemsByKey 
		at: anItem key first 
		put: (Association basicNew key: anItem key second value: anItem).
	anItem isFinal
		ifTrue: [ 
			anItem start = self
				ifTrue: [ finalItemsByNonterminal at: anItem head put: anItem ] ]
		ifFalse: [ 
			anItem symbolAtDot isNonterminal 
				ifTrue: [ predictionItemsByNonterminal at: anItem symbolAtDot put: anItem ] ].
	items nextPut: anItem.
	^ anItem
		end: self;
		yourself