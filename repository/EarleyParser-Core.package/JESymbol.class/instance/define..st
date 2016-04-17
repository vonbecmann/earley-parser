instance creation
define: aNonTerminal
	" a sequence with self define a nonterminal
	  aNonTerminal ::= self"

	^ JESequence new , self define: aNonTerminal