instance creation
head: aNonTerminal
	"aNonTerminal ::= self"

	^ JESequence new , self head: aNonTerminal