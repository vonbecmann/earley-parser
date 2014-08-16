accessing
altenativesOf: aNonterminal 
	self assert: (nonterminals includes: aNonterminal).
	^ alternatives at: aNonterminal 