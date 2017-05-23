parsing
addTerminalItem: terminalItem
	" add a scanned terminal while parsing "

	(itemsByKey at: terminalItem key first ifAbsent: nil)
		ifNotNil: 
			[ :dict | 
				(dict at: terminalItem key second ifAbsent: nil) 
					ifNotNil: [ :found | ^ found ] ].
	itemsByKey
		at: terminalItem key first
		add: (Association key: terminalItem key second value: terminalItem).
	^ terminalItem
		end: self;
		yourself