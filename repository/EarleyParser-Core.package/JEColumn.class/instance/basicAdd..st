private
basicAdd: anItem
	itemsByKey 
		at: anItem key first 
		add: (Association basicNew key: anItem key second value: anItem).
	anItem isFinal
		ifTrue: [ 
			anItem start = self
				ifTrue: [ finalItemsByNonterminal at: anItem head add: anItem ] ]
		ifFalse: [ 
			anItem symbolAtDot isNonterminal 
				ifTrue: [ predictionItemsByNonterminal at: anItem symbolAtDot add: anItem ] ].
	items nextPut: anItem.
	^ anItem
		end: self;
		yourself