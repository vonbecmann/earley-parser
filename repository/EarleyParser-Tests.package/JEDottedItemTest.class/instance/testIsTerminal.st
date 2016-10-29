tests
testIsTerminal
	item := (rule dotAt: 2) startedAt: first.
	
	self deny: item isTerminal.
	self assert: item isNonterminal 