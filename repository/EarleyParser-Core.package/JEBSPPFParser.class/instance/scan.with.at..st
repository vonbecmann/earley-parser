private operations
scan: item with: word at: column
	self addFamilyWith: item word: word to: (column moveDotForward: item)
	