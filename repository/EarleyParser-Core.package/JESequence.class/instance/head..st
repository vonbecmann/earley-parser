instance creation
head: aJENonterminal
	self assert: aJENonterminal isTerminal not.
	^ JERule head: aJENonterminal body: symbols asArray