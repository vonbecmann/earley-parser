accessing
at: anItem
	| itemsAtChart |
	itemsAtChart := itemsByChart at: anItem startChart ifAbsentPut: [ ^ nil ].
	^ itemsAtChart detect: [ :each | each = anItem ] ifNone: [ nil ]