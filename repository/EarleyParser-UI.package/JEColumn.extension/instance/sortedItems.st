*EarleyParser-UI
sortedItems
	| sortedItems |
	sortedItems := SortedCollection new.
	sortedItems sortBlock: [ :a :b | a start <= b start ].
	itemsByKey associationsDo: [ :assoc | assoc value do: [ :each | sortedItems add: each ] ].
	^ sortedItems