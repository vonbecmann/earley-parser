adding
add: anItem
	^ (self itemsAt: anItem startChart)
		detect: [ :each | each equals: anItem ]
		ifFound: [ :found | found ]
		ifNone: [ 
			self itemsAt: anItem startChart put: anItem.
			(anItem isFinal or: [ anItem symbolAtDot isTerminal ])
				ifFalse: [ self predictionItemsAt: anItem symbolAtDot put: anItem ].
			items addLast: anItem.
			anItem endChart: self.
			anItem ]