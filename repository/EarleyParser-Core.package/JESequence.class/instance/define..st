instance creation
define: aJENonterminal
	" a sequence of symbol define a nonterminal "

	self assert: aJENonterminal isTerminal not.
	^ JERule head: aJENonterminal body: symbols asArray