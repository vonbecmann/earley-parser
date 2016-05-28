parsing
addTerminalNode: anObject
	" add a scanned terminal while parsing "

	^ terminalNodes jeAdd: (JEPackedNode model: anObject)