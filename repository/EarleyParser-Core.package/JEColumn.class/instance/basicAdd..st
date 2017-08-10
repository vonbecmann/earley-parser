private
basicAdd: anItem
	self itemsAt: anItem key put: anItem.
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