tests
testParseGrammarWithDuplicateRule
	| spec grammar |
	spec := 
	   #((E (T)) 
		(E (E + T)) 
		(T (P)) 
		(T (T * P))
		(T (T * P)) " duplicate rule " 
		(P (a))).
	grammar := parser parseGrammarFrom: spec.
	self assert: (JENonterminal for: #E) equals: grammar startSymbol.
	self assert: 3 equals: grammar terminals size.
	self assert: 3 equals: grammar nonterminals size.
	self assert: 5 equals: grammar rules size