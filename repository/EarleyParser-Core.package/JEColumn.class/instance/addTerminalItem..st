parsing
addTerminalItem: terminalItem
	" add a scanned terminal while parsing "

	(itemsByKey at: terminalItem firstKey ifAbsent: nil)
		ifNotNil: 
			[ :dict | 
				(dict at: terminalItem secondKey ifAbsent: nil) 
					ifNotNil: [ :found | ^ found ] ].
	self itemsByKeyPut: terminalItem.
	^ terminalItem
		end: self;
		yourself