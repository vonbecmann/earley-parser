tests
testIsNonterminal
	item := (rule dotAt: 2) startedAt: first.

	self assert: item isNonterminal.
	self deny: item isTerminal 