initialization
initializeHead: aNonterminal body: aCollection
	self initialize.
	head := aNonterminal.
	body := aCollection asArray