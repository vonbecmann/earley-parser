private operations
scan: item with: word at: column
	moveDotForwardCount := moveDotForwardCount + 1.
	scanCount := scanCount + 1.
	super scan: item with: word at: column