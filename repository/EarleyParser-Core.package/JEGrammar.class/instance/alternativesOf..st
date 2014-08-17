accessing
alternativesOf: aNonterminal 
	self assert: (nonterminals includes: aNonterminal).
	^ alternatives at: aNonterminal 