testing
isNullable: aJENonterminal
	"a nonterminal can derive epsilon?"

	^ nullables at: aJENonterminal ifAbsent: [ false ]