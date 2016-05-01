testing
isNullable: aJENonterminal
	"a nonterminal can derive epsilon?"

	^ nullables 
		at: aJENonterminal 
		ifAbsent: [ self error: 'Unknown Nonterminal named ' , aJENonterminal asString ]