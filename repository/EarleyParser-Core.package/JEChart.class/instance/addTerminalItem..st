parsing
addTerminalItem: terminalItem
	" add a scanned terminal while parsing "

	(itemsByKey at: terminalItem key first ifAbsent: nil)
		ifNotNil: [ :dict | (dict at: terminalItem key second ifAbsent: nil) ifNotNil: [ :found | ^ found ] ].
	itemsByKey at: terminalItem key first add: terminalItem key second -> terminalItem.
	^ terminalItem
		endChart: self;
		yourself