parsing
addTerminalItem: terminalItem
	" add a scanned terminal while parsing "

	(itemsByKey at: terminalItem key first ifAbsent: nil)
		ifNotNil: 
			[ :dict | 
				(dict at: terminalItem key second ifAbsent: nil) 
					ifNotNil: [ :found | ^ found ] ].
	self itemsAt: terminalItem key put: terminalItem.
	^ terminalItem
		end: self;
		yourself