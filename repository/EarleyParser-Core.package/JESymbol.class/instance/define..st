instance creation
define: aNonTerminal
	"aNonTerminal ::= self"

	^ JESequence new , self define: aNonTerminal