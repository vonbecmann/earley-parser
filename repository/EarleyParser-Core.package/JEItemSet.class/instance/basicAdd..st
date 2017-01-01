private
basicAdd: anItem
	anItem isFinal
		ifTrue: [ anItem startChart = self
				ifTrue: [ finalItemsByNonterminal at: anItem head add: anItem ] ]
		ifFalse: [ anItem symbolAtDot isTerminal
				ifFalse: [ predictionItemsByNonterminal at: anItem symbolAtDot add: anItem ] ].
	items nextPut: anItem.
	^ anItem
		endChart: self;
		yourself