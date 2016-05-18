initialization
initializeHead: aNonterminal body: aCollection
	self initialize.
	head := aNonterminal.
	body := aCollection asArray.
	dottedRules := (1 to: body size + 1) collect: [ :each | JEDottedRule given: self withDotAt: each ]