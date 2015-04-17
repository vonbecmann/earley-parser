adding
add: anItem
	^ (self itemsAt: anItem startChart)
		detect: [ :each | each = anItem ]
		ifFound: [ :found | found ]
		ifNone: [ 
			self itemsAt: anItem startChart put: anItem.
			items addLast: anItem.
			anItem endChart: self.
			anItem ]