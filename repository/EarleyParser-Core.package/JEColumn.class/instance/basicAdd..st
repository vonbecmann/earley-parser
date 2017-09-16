private
basicAdd: anItem
	self itemsByKeyPut: anItem.
	anItem isFinal
		ifTrue: [ 
			anItem start = self
				ifTrue: [ self finalItemsByNonterminalAt: anItem head put: anItem ] ]
		ifFalse: [ 
			anItem symbolAtDot isNonterminal 
				ifTrue: [ self predictionItemsByNonterminalAt: anItem symbolAtDot put: anItem ] ].
	items nextPut: anItem.
	^ anItem
		end: self;
		yourself