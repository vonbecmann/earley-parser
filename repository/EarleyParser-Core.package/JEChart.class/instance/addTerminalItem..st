parsing
addTerminalItem: terminalItem
	" add a scanned terminal while parsing "
	terminalItem endChart: self.
	^ terminalItems jeAdd: terminalItem