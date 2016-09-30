accessing
like: anItem
	" Answer an item in the receiver that is equal to anItem, nil if no such item is found. 
	 Optimize for efficiency.
	^ itemsByKey detect: [ :each | each equals: anItem ] ifNone: [ nil ] "

	(itemsByKey at: anItem key first ifAbsent: nil)
		ifNotNil: [ :dict | 
			(dict at: anItem key second ifAbsent: nil)
				ifNotNil: [ :found | 
					^ (found equals: anItem) ifTrue: [ found ]	ifFalse: [ nil ] ] ].
	^ nil