instance creation
define: aJENonterminal
	" a sequence of symbols define a nonterminal "

	self assert: aJENonterminal isTerminal not.
	^ JERule head: aJENonterminal body: symbols asArray