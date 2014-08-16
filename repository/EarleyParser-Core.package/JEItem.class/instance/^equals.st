comparing
= anItem
	dotPosition = anItem dotPosition
		ifFalse: [ ^ false ].
	itemset = anItem itemset
		ifFalse: [ ^ false ].
	rule = anItem rule
		ifFalse: [ ^ false ].
	^ true